import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';

import '../../data/model/specialist_profile_model_dto/specialist_profile_model_dto.dart';
import '../../domain/entity/specialist_profile_model/specialist_profile_model.dart';

@Injectable(as: Factory<SpecialistProfileModelDto, SpecialistProfileModel>)
class SpecialistProfileModelToDto
    implements Factory<SpecialistProfileModelDto, SpecialistProfileModel> {
  @override
  SpecialistProfileModelDto create(SpecialistProfileModel param) =>
      SpecialistProfileModelDto(
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
