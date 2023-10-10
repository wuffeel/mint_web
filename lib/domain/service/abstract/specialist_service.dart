import 'package:mint_core/mint_core.dart';

abstract class SpecialistService {
  Future<List<String>> fetchAvailableSpecializations();

  Future<void> addSpecialistWithId(String id, SpecialistModel specialist);

  Future<void> addWorkInfoData(
    String specialistId,
    Map<String, Map<String, String>> workInfoMap,
  );

  Future<SpecialistModel?> fetchSpecialistData(String specialistId);

  /// Returns photoUrl link for to use for [specialist] and [user]
  Future<String?> updateSpecialistData(
    SpecialistModel specialist,
    UserModel user, {
    FileData? photoData,
  });
}
