import 'package:injectable/injectable.dart';

import '../service/abstract/phone_auth_service.dart';

@injectable
class VerifyPhoneUseCase {
  VerifyPhoneUseCase(this._service);

  final PhoneAuthService _service;

  Future<void> call({required String phoneNumber}) =>
      _service.verifyPhoneNumber(phoneNumber: phoneNumber);
}
