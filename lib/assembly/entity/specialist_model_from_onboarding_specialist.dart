import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';
import 'package:mint_core/mint_core.dart';

import '../../domain/entity/onboarding_specialist/onboarding_specialist.dart';

@Injectable(as: Factory<SpecialistModel, OnboardingSpecialist>)
class SpecialistModelFromOnboardingSpecialist
    implements Factory<SpecialistModel, OnboardingSpecialist> {
  @override
  SpecialistModel create(OnboardingSpecialist param) => SpecialistModel(
        id: '',
        firstName: param.firstName,
        lastName: param.lastName,
        price: param.price,
        experience: param.experience,
        specializations: param.specializations,
        about: param.about,
        education: param.education,
        photoUrl: param.photoUrl,
      );
}
