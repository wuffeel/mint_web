import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

import '../../../domain/controller/specialist_controller.dart';
import '../../../domain/usecase/fetch_specialist_data_use_case.dart';

part 'specialist_info_event.dart';

part 'specialist_info_state.dart';

@injectable
class SpecialistInfoBloc
    extends Bloc<SpecialistInfoEvent, SpecialistInfoState> {
  SpecialistInfoBloc(
    this._fetchSpecialistDataUseCase,
    this._specialistController,
    this._userController,
  ) : super(SpecialistInfoInitial()) {
    _subscribeToUserChange();
    on<SpecialistInfoInitializeRequested>(_onSpecialistInfoInitialize);
    on<SpecialistInfoFetchRequested>(_onFetchSpecialistInfo);
  }

  final FetchSpecialistDataUseCase _fetchSpecialistDataUseCase;

  final SpecialistController _specialistController;
  final UserController _userController;

  UserModel? _currentUser;
  late final StreamSubscription<UserModel?> _userSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onSpecialistInfoInitialize(
    SpecialistInfoInitializeRequested event,
    Emitter<SpecialistInfoState> emit,
  ) async {
    return emit.forEach(
      _specialistController.specialist,
      onData: SpecialistInfoFetchSuccess.new,
    );
  }

  Future<void> _onFetchSpecialistInfo(
    SpecialistInfoFetchRequested event,
    Emitter<SpecialistInfoState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    final state = this.state;
    if (state is SpecialistInfoFetchSuccess && state.specialist.id == user.id) {
      return;
    }

    try {
      emit(SpecialistInfoLoading());
      final specialist = await _fetchSpecialistDataUseCase(user.id);
      if (specialist == null) {
        emit(SpecialistInfoNotFound());
        return;
      }
      _specialistController.addToSpecialistStream(specialist);
    } catch (error) {
      debugPrint('SpecialistInfoFetchFailure: $error');
      emit(SpecialistInfoFetchFailure());
    }
  }
}
