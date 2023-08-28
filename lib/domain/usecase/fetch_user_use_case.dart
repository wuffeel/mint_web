import 'package:injectable/injectable.dart';

import '../entity/user_model/user_model.dart';
import '../service/abstract/user_service.dart';

@injectable
class FetchUserUseCase {
  FetchUserUseCase(this._service);

  final UserService _service;

  Future<UserModel?> call() => _service.getCurrentUser();
}
