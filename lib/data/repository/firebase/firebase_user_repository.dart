import 'package:injectable/injectable.dart';

import '../../model/user_model_dto/user_model_dto.dart';
import '../abstract/user_repository.dart';
import 'firebase_initializer.dart';

@Injectable(as: UserRepository)
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository(this._firebaseInitializer);

  static const _userCollection = 'users';

  final FirebaseInitializer _firebaseInitializer;

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
  Future<void> logOut() async {
    final firebaseAuth = await _firebaseInitializer.firebaseAuth;
    await firebaseAuth.signOut();
  }
}
