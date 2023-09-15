import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

@injectable
class UpdateUserDataUseCase {
  UpdateUserDataUseCase(this._service);

  final UserService _service;

  Future<UserModel> call(UserModel user, {FileData? photoData}) =>
      _service.updateUserData(user, photoData: photoData);
}
