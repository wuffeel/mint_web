import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../assembly/factory.dart' as assembly;
import '../../../domain/controller/specialist_controller.dart';
import '../../../domain/controller/user_controller.dart';
import '../../../domain/entity/onboarding/onboarding.dart';
import '../../../domain/entity/onboarding_specialist/onboarding_specialist.dart';
import '../../../domain/entity/specialist_model/specialist_model.dart';
import '../../../domain/entity/user_model/user_model.dart';
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
      final onboardingSpec =
          _onboardingSpecialistFromOnboarding.create(event.onboarding);

      if (onboardingSpec == null) return;

      final specialistModel =
          _specialistModelFromOnboarding.create(onboardingSpec);
      final userModel = _userModelFromOnboarding.create(onboardingSpec);

      await _addSpecialistWithIdUseCase(user.id, specialistModel);
      await _addWorkInfoDataUseCase(user.id, onboardingSpec.workInfo);

      final phone = user.phoneNumber;
      final userData = await _updateUserDataUseCase(
        userModel.copyWith(phoneNumber: phone),
      );

      _specialistController.addToSpecialistStream(specialistModel);
      _userController.addToUserStream(userData);
    } catch (error) {
      debugPrint('SpecialistAddNewFailure: $error');
      emit(SpecialistAddNewFailure());
    }
  }
}
