import 'package:injectable/injectable.dart';

import '../../../assembly/factory.dart';
import '../../../data/model/user_model_dto/user_model_dto.dart';
import '../../../data/repository/abstract/user_repository.dart';
import '../../entity/user_model/user_model.dart';
import '../abstract/user_service.dart';

@Injectable(as: UserService)
class FirebaseUserService implements UserService {
  FirebaseUserService(
    this._userRepository,
    this._userModelFromDto,
    this._userModelToDto,
  );

  final UserRepository _userRepository;

  final Factory<Future<UserModel>, UserModelDto> _userModelFromDto;
  final Factory<Future<UserModelDto>, UserModel> _userModelToDto;

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = await _userRepository.getCurrentUser();
    if (user == null) return null;
    return _userModelFromDto.create(user);
  }

  @override
  Future<UserModel> updateUserData(UserModel userData) async {
    final userDataDto = await _userModelToDto.create(userData);
    await _userRepository.updateUserData(userDataDto);
    final photoUrl = userData.photoUrl;
    final user = photoUrl == null || photoUrl.startsWith('http')
        ? userData
        : await _userModelFromDto.create(userDataDto);
    return user;
  }

  @override
  Future<void> logOut() {
    return _userRepository.logOut();
  }
}
