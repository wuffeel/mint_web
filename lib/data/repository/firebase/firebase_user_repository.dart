import 'package:injectable/injectable.dart';

import '../../../assembly/factory.dart';
import '../../model/user_model_dto/user_model_dto.dart';
import '../abstract/user_repository.dart';
import 'firebase_initializer.dart';

@Injectable(as: UserRepository)
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository(this._firebaseInitializer, this._modifiedUserToMap,);

  static const _userCollection = 'users';

  final FirebaseInitializer _firebaseInitializer;

  final Factory<Map<String, dynamic>, UserModelDto> _modifiedUserToMap;

  @override
  Future<UserModelDto?> getCurrentUser() async {
    final firestore = await _firebaseInitializer.firestore;
    final firebaseAuth = await _firebaseInitializer.firebaseAuth;

    final user = firebaseAuth.currentUser;
    if (user == null) return null;

    final userDoc =
    await firestore.collection(_userCollection).doc(user.uid).get();
    final userData = userDoc.data();

    if (userData == null) {
      return UserModelDto(id: user.uid, phoneNumber: user.phoneNumber);
    }
    return UserModelDto.fromJsonWithId(userData, user.uid);
  }

  @override
  Future<void> updateUserData(UserModelDto user) async {
    final firestore = await _firebaseInitializer.firestore;

    final userMap = _modifiedUserToMap.create(user);

    return firestore.collection(_userCollection).doc(user.id).update(userMap);
  }

  @override
  Future<void> logOut() async {
    final firebaseAuth = await _firebaseInitializer.firebaseAuth;
    await firebaseAuth.signOut();
  }
}
