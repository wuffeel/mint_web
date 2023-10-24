import 'package:mint_core/mint_core.dart';

import '../../model/specialist_profile_model_dto/specialist_profile_model_dto.dart';

abstract class SpecialistRepository {
  Future<List<String>> fetchAvailableSpecializations();

  Future<void> addSpecialistWithId(String id, SpecialistModelDto specialist);

  Future<void> addWorkInfoData(
    String specialistId,
    Map<String, Map<String, String>> workInfoMap,
  );

  Future<SpecialistModelDto?> fetchSpecialistData(String specialistId);

  Future<void> updateSpecialistData(SpecialistProfileModelDto specialist);
}
