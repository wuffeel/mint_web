import '../../entity/user_model/user_model.dart';

abstract class UserService {
  Future<UserModel?> getCurrentUser();

  Future<UserModel> updateUserData(UserModel user);

  Future<void> logOut();
}
