import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_module.dart';

@injectable
class LogOutUseCase {
  LogOutUseCase(this._service);

  final UserService _service;

  Future<void> call() => _service.logOut();
}
