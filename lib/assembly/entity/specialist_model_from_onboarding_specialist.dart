import 'package:injectable/injectable.dart';

import '../../domain/entity/onboarding_specialist/onboarding_specialist.dart';
import '../../domain/entity/specialist_model/specialist_model.dart';
import '../factory.dart';

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
