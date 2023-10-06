import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

import '../../../domain/controller/specialist_controller.dart';
import '../../../domain/usecase/fetch_specializations_use_case.dart';
import '../../../domain/usecase/update_specialist_profile_data_use_case.dart';

part 'specialist_profile_event.dart';

part 'specialist_profile_state.dart';

@injectable
class SpecialistProfileBloc
    extends Bloc<SpecialistProfileEvent, SpecialistProfileState> {
  SpecialistProfileBloc(
    this._fetchSpecializationsUseCase,
    this._updateSpecialistProfileDataUseCase,
    this._specialistController,
    this._userController,
  ) : super(const SpecialistProfileInitial()) {
    _subscribeToUserChange();
    on<SpecialistProfileEditRequested>(_onEditSpecialistInfo);
    on<SpecialistProfileEditCancelRequested>(_onEditCancel);
    on<SpecialistProfileEditInfoChanged>(_onEditInfoChange);
    on<SpecialistProfileUpdateRequested>(_onUpdateSpecialistInfo);
  }

  final FetchSpecializationsUseCase _fetchSpecializationsUseCase;
  final UpdateSpecialistProfileDataUseCase _updateSpecialistProfileDataUseCase;

  final SpecialistController _specialistController;
  final UserController _userController;

  UserModel? _currentUser;
  SpecialistModel? _currentSpecialist;
  late final StreamSubscription<UserModel?> _userSubscription;
  late final StreamSubscription<SpecialistModel?> _specialistSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
    _specialistSubscription = _specialistController.specialist
        .listen((specialist) => _currentSpecialist = specialist);
  }

  @override
  Future<void> close() async {
    await Future.wait([
      _userSubscription.cancel(),
      _specialistSubscription.cancel(),
    ]);
    return super.close();
  }

  Future<void> _onEditSpecialistInfo(
    SpecialistProfileEditRequested event,
    Emitter<SpecialistProfileState> emit,
  ) async {
    final user = _currentUser;
    final specialist = _currentSpecialist;
    if (user == null || specialist == null) return;

    SpecialistProfileEditState editState(List<String>? specializations) =>
        SpecialistProfileEditState(
          specialist,
          user,
          availableSpecializations: specializations,
        );

    if (state.availableSpecializations != null) {
      emit(editState(state.availableSpecializations));
      return;
    }

    try {
      emit(SpecialistProfileSpecializationsLoading(specialist, user));
      final specializations = await _fetchSpecializationsUseCase();
      emit(editState(specializations));
    } catch (error) {
      debugPrint('SpecialistProfileSpecializationsFetchFailure: $error');
      emit(SpecialistProfileSpecializationsFetchFailure());
    }
  }

  void _onEditInfoChange(
    SpecialistProfileEditInfoChanged event,
    Emitter<SpecialistProfileState> emit,
  ) {
    final state = this.state;
    if (state is! SpecialistProfileEditState) return;
    emit(
      SpecialistProfileEditState(
        event.specialist ?? state.specialist,
        event.user ?? state.user,
        availableSpecializations: state.availableSpecializations,
        photoData: event.photoData ?? state.photoData,
      ),
    );
  }

  void _onEditCancel(
    SpecialistProfileEditCancelRequested event,
    Emitter<SpecialistProfileState> emit,
  ) {
    emit(
      SpecialistProfileInitial(
        availableSpecializations: state.availableSpecializations,
      ),
    );
  }

  Future<void> _onUpdateSpecialistInfo(
    SpecialistProfileUpdateRequested event,
    Emitter<SpecialistProfileState> emit,
  ) async {
    final state = this.state;
    if (state is! SpecialistProfileEditState) return;
    try {
      await _updateSpecialistProfileDataUseCase(
        state.specialist,
        state.user,
        photoData: state.photoData,
      );
      _specialistController.addToSpecialistStream(state.specialist);
      _userController.addToUserStream(state.user);
      emit(
        SpecialistProfileUpdateSuccess(
          availableSpecializations: state.availableSpecializations,
        ),
      );
    } catch (error) {
      debugPrint('SpecialistProfileUpdateFailure: $error');
      emit(
        SpecialistProfileUpdateFailure(
          availableSpecializations: state.availableSpecializations,
        ),
      );
    }
  }
}
