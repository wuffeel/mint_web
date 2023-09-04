import 'package:injectable/injectable.dart';

import '../../../assembly/factory.dart';
import '../../../data/model/specialist_model_dto/specialist_model_dto.dart';
import '../../../data/repository/abstract/specialist_repository.dart';
import '../../entity/specialist_model/specialist_model.dart';
import '../abstract/specialist_service.dart';

@Injectable(as: SpecialistService)
class FirebaseSpecialistService implements SpecialistService {
  FirebaseSpecialistService(
    this._specialistRepository,
    this._specialistModelFromDto,
    this._specialistModelToDto,
  );

  final SpecialistRepository _specialistRepository;

  final Factory<Future<SpecialistModel>, SpecialistModelDto>
      _specialistModelFromDto;
  final Factory<SpecialistModelDto, SpecialistModel> _specialistModelToDto;

  @override
  Future<List<String>> fetchAvailableSpecializations() {
    return _specialistRepository.fetchAvailableSpecializations();
  }

  @override
  Future<void> addSpecialistWithId(
    String id,
    SpecialistModel specialist,
  ) async {
    return _specialistRepository.addSpecialistWithId(
      id,
      _specialistModelToDto.create(specialist),
    );
  }

  @override
  Future<void> addWorkInfoData(
    String specialistId,
    Map<String, Map<String, String>> workInfoMap,
  ) {
    return _specialistRepository.addWorkInfoData(specialistId, workInfoMap);
  }

  @override
  Future<SpecialistModel?> fetchSpecialistData(String specialistId) async {
    final specialist = await _specialistRepository.fetchSpecialistData(
      specialistId,
    );
    if (specialist == null) return null;
    return _specialistModelFromDto.create(specialist);
  }
}
