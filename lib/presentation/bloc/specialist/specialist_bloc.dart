import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import 'package:mint_core/mint_assembly.dart' as assembly;
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import '../../../domain/controller/specialist_controller.dart';
import '../../../domain/entity/onboarding/onboarding.dart';
import '../../../domain/entity/onboarding_specialist/onboarding_specialist.dart';
import '../../../domain/usecase/add_new_specialist_use_case.dart';
import '../../../domain/usecase/add_work_info_data_use_case.dart';
import '../../../domain/usecase/update_user_data_use_case.dart';

part 'specialist_event.dart';

part 'specialist_state.dart';

@injectable
class SpecialistBloc extends Bloc<SpecialistEvent, SpecialistState> {
  SpecialistBloc(
    this._addSpecialistWithIdUseCase,
    this._updateUserDataUseCase,
    this._addWorkInfoDataUseCase,
    this._onboardingSpecialistFromOnboarding,
    this._specialistModelFromOnboarding,
    this._userModelFromOnboarding,
    this._userController,
    this._specialistController,
  ) : super(SpecialistInitial()) {
    _subscribeToUserChange();
    on<SpecialistAddNewRequested>(_onAddNewSpecialist);
  }

  final AddSpecialistWithIdUseCase _addSpecialistWithIdUseCase;
  final UpdateUserDataUseCase _updateUserDataUseCase;
  final AddWorkInfoDataUseCase _addWorkInfoDataUseCase;

  final assembly.Factory<OnboardingSpecialist?, Onboarding>
      _onboardingSpecialistFromOnboarding;
  final assembly.Factory<SpecialistModel, OnboardingSpecialist>
      _specialistModelFromOnboarding;
  final assembly.Factory<UserModel, OnboardingSpecialist>
      _userModelFromOnboarding;

  UserModel? _currentUser;

  final UserController _userController;
  final SpecialistController _specialistController;

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

  Future<void> _onAddNewSpecialist(
    SpecialistAddNewRequested event,
    Emitter<SpecialistState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    try {
      emit(SpecialistAddNewLoading());
      final onboardingSpec = _onboardingSpecialistFromOnboarding
          .create(event.onboarding)
          ?.copyWith(phoneNumber: user.phoneNumber);
      if (onboardingSpec == null) return;

      final specialistModel = await _updateSpecialistData(user, onboardingSpec);
      final userData = await _updateUserData(user, onboardingSpec);

      _specialistController.addToSpecialistStream(specialistModel);
      _userController.addToUserStream(userData);
    } catch (error) {
      debugPrint('SpecialistAddNewFailure: $error');
      emit(SpecialistAddNewFailure());
    }
  }

  /// Converts [onboardingSpecialist] to [SpecialistModel] and calls use case
  /// events to update specialist data and work info in database.
  ///
  /// Returns converted [onboardingSpecialist].
  Future<SpecialistModel> _updateSpecialistData(
    UserModel user,
    OnboardingSpecialist onboardingSpecialist,
  ) async {
    final specialistModel = _specialistModelFromOnboarding.create(
      onboardingSpecialist,
    );
    await Future.wait([
      _addSpecialistWithIdUseCase(user.id, specialistModel),
      _addWorkInfoDataUseCase(user.id, onboardingSpecialist.workInfo),
    ]);

    return specialistModel;
  }

  /// Converts [onboardingSpecialist] to [UserModel] and calls use case
  /// event to update user data in database.
  ///
  /// Returns converted [onboardingSpecialist].
  Future<UserModel> _updateUserData(
    UserModel user,
    OnboardingSpecialist onboardingSpecialist,
  ) async {
    final userModel = _userModelFromOnboarding.create(onboardingSpecialist);
    return _updateUserDataUseCase(userModel.copyWith(id: user.id));
  }
}
