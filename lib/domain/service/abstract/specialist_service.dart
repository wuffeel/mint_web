import '../../entity/specialist_model/specialist_model.dart';

abstract class SpecialistService {
  Future<List<String>> fetchAvailableSpecializations();

  Future<void> addSpecialistWithId(String id, SpecialistModel specialist);

  Future<void> addWorkInfoData(
    String specialistId,
    Map<String, Map<String, String>> workInfoMap,
  );

  Future<SpecialistModel?> fetchSpecialistData(String specialistId);
}
