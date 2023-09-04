import 'package:injectable/injectable.dart';

import '../../model/specialist_model_dto/specialist_model_dto.dart';
import '../abstract/specialist_repository.dart';
import 'firebase_initializer.dart';

@Injectable(as: SpecialistRepository)
class FirebaseSpecialistRepository implements SpecialistRepository {
  FirebaseSpecialistRepository(this._firebaseInitializer);

  static const _filterCollection = 'filter';
  static const _specialistCollection = 'specialists';
  static const _workInfoCollection = 'work_info';

  static const _specialistFilterDocId = 'specialist_filter';
  static const _specializations = 'specializations';

  final FirebaseInitializer _firebaseInitializer;

  @override
  Future<List<String>> fetchAvailableSpecializations() async {
    final firestore = await _firebaseInitializer.firestore;

    final filterDoc = await firestore
        .collection(_filterCollection)
        .doc(_specialistFilterDocId)
        .get();

    final data = filterDoc.data();
    final specializations = data?[_specializations] as List<dynamic>?;
    if (data == null || specializations == null) return <String>[];

    return List<String>.from(specializations);
  }

  @override
  Future<void> addSpecialistWithId(
    String id,
    SpecialistModelDto specialist,
  ) async {
    final firestore = await _firebaseInitializer.firestore;

    return firestore
        .collection(_specialistCollection)
        .doc(id)
        .set(specialist.toJsonWithoutId());
  }

  @override
  Future<void> addWorkInfoData(
    String specialistId,
    Map<String, Map<String, String>> workInfoMap,
  ) async {
    final firestore = await _firebaseInitializer.firestore;

    return firestore
        .collection(_workInfoCollection)
        .doc('info_$specialistId')
        .set(workInfoMap);
  }

  @override
  Future<SpecialistModelDto?> fetchSpecialistData(String specialistId) async {
    final firestore = await _firebaseInitializer.firestore;

    final specialistDoc = await firestore
        .collection(_specialistCollection)
        .doc(specialistId)
        .get();

    final data = specialistDoc.data();
    if (data == null) return null;

    return SpecialistModelDto.fromJsonWithId(data, specialistDoc.id);
  }
}
