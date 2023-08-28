import '../../entity/user_model/user_model.dart';

abstract class UserService {
  Future<UserModel?> getCurrentUser();

  Future<void> logOut();
}
