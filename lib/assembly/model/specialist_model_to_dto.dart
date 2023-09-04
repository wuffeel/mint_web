import 'package:injectable/injectable.dart';

import '../../data/model/specialist_model_dto/specialist_model_dto.dart';
import '../../domain/entity/specialist_model/specialist_model.dart';
import '../factory.dart';

@Injectable(as: Factory<SpecialistModelDto, SpecialistModel>)
class SpecialistModelToDto
    implements Factory<SpecialistModelDto, SpecialistModel> {
  @override
  SpecialistModelDto create(SpecialistModel param) => SpecialistModelDto(
        id: param.id,
        firstName: param.firstName,
        lastName: param.lastName,
        price: param.price,
        experience: param.experience,
        specializations: param.specializations,
        rating: param.rating,
        reviewCount: param.reviewCount,
        photoUrl: param.photoUrl,
        about: param.about,
        education: param.education,
      );
}
