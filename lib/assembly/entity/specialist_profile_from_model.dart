import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';
import 'package:mint_core/mint_core.dart';

import '../../domain/entity/specialist_profile_model/specialist_profile_model.dart';

@Injectable(as: Factory<SpecialistProfileModel, SpecialistModel>)
class SpecialistProfileFromModel
    implements Factory<SpecialistProfileModel, SpecialistModel> {
  @override
  SpecialistProfileModel create(SpecialistModel param) =>
      SpecialistProfileModel(
        id: param.id,
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
