import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
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
    on<SpecialistProfilePickImageRequested>(_onPickImage);
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
          [...specialist.specializations],
          availableSpecializations: specializations,
        );

    if (state.availableSpecializations != null) {
      emit(editState(state.availableSpecializations));
      return;
    }

    try {
      emit(
        SpecialistProfileSpecializationsLoading(
          specialist,
          user,
          specialist.specializations,
        ),
      );
      final specializations = await _fetchSpecializationsUseCase();
      emit(editState(specializations..sort()));
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
      state.copyWith(
        specialist: event.specialist,
        user: event.user,
        currentSpecializations: event.currentSpecializations,
        photoData: event.photoData,
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

  Future<void> _onPickImage(
    SpecialistProfilePickImageRequested event,
    Emitter<SpecialistProfileState> emit,
  ) async {
    final state = this.state;
    if (state is! SpecialistProfileEditState) return;

    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    final bytes = await image?.readAsBytes();
    if (image == null || bytes == null) return;

    emit(state.copyWith(photoData: FileData(name: image.name, bytes: bytes)));
  }

  Future<void> _onUpdateSpecialistInfo(
    SpecialistProfileUpdateRequested event,
    Emitter<SpecialistProfileState> emit,
  ) async {
    final state = this.state;
    if (state is! SpecialistProfileEditState) return;
    try {
      final specializations =
          state.currentSpecializations.whereType<String>().toList();
      final specialist =
          state.specialist.copyWith(specializations: specializations);

      emit(
        SpecialistProfileUpdateLoading(
          specialist,
          state.user,
          state.currentSpecializations,
          availableSpecializations: state.availableSpecializations,
          photoData: state.photoData,
        ),
      );
      final photoUrl = await _updateSpecialistProfileDataUseCase(
        specialist,
        state.user,
        photoData: state.photoData,
      );
      _specialistController
          .addToSpecialistStream(specialist.copyWith(photoUrl: photoUrl));
      _userController.addToUserStream(state.user.copyWith(photoUrl: photoUrl));
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
