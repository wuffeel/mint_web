import '../../model/specialist_model_dto/specialist_model_dto.dart';

abstract class SpecialistRepository {
  Future<List<String>> fetchAvailableSpecializations();

  Future<void> addSpecialistWithId(String id, SpecialistModelDto specialist);

  Future<SpecialistModelDto?> fetchSpecialistData(String specialistId);
}
