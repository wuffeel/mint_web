import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

@injectable
class FetchUserUseCase {
  FetchUserUseCase(this._service);

  final UserService _service;

  Future<UserModel?> call() => _service.getCurrentUser();
}
