import 'package:injectable/injectable.dart';

import '../../data/model/onboarding_specialist_dto/onboarding_specialist_dto.dart';
import '../../domain/entity/onboarding_specialist/onboarding_specialist.dart';
import '../factory.dart';

@Injectable(as: Factory<OnboardingSpecialistDto, OnboardingSpecialist>)
class OnboardingSpecialistToDto
    implements Factory<OnboardingSpecialistDto, OnboardingSpecialist> {
  @override
  OnboardingSpecialistDto create(OnboardingSpecialist param) =>
      OnboardingSpecialistDto(
        firstName: param.firstName,
        lastName: param.lastName,
        email: param.email,
        dateOfBirth: param.dateOfBirth,
        price: param.price,
        experience: param.experience,
        about: param.about,
        education: param.education,
        specializations: param.specializations,
        workInfo: param.workInfo,
        photoUrl: param.photoUrl,
      );
}
