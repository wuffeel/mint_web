import '../../model/user_model_dto/user_model_dto.dart';

abstract class UserRepository {
  Future<UserModelDto?> getCurrentUser();

  Future<void> updateUserData(UserModelDto user);

  Future<void> logOut();
}
