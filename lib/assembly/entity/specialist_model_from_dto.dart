import 'package:injectable/injectable.dart';

import '../../data/model/specialist_model_dto/specialist_model_dto.dart';
import '../../domain/entity/specialist_model/specialist_model.dart';
import '../../domain/service/abstract/storage_service.dart';
import '../factory.dart';

@Injectable(as: Factory<Future<SpecialistModel>, SpecialistModelDto>)
class SpecialistModelFromDto
    implements Factory<Future<SpecialistModel>, SpecialistModelDto> {
  SpecialistModelFromDto(this._service);

  final StorageService _service;

  @override
  Future<SpecialistModel> create(SpecialistModelDto param) async =>
      SpecialistModel(
        id: param.id,
        firstName: param.firstName,
        lastName: param.lastName,
        price: param.price,
        experience: param.experience,
        specializations: param.specializations,
        rating: param.rating,
        reviewCount: param.reviewCount,
        photoUrl: await _service.getLinkByStorageUrl(param.photoUrl),
        about: param.about,
        education: param.education,
      );
}
