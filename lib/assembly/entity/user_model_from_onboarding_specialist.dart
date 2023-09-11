import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';
import 'package:mint_core/mint_core.dart';

import '../../domain/entity/onboarding_specialist/onboarding_specialist.dart';

@Injectable(as: Factory<UserModel, OnboardingSpecialist>)
class UserModelFromOnboardingSpecialist
    implements Factory<UserModel, OnboardingSpecialist> {
  @override
  UserModel create(OnboardingSpecialist param) => UserModel(
        id: '',
        phoneNumber: param.phoneNumber,
        photoUrl: param.photoUrl,
        firstName: param.firstName,
        lastName: param.lastName,
        email: param.email,
        dateOfBirth: param.dateOfBirth,
      );
}
