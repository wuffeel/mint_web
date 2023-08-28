import 'package:injectable/injectable.dart';

import '../service/abstract/phone_auth_service.dart';

@injectable
class VerifyOtpUseCase {
  VerifyOtpUseCase(this._service);

  final PhoneAuthService _service;

  Future<void> call({required String otpCode}) =>
      _service.verifyOtpCode(otpCode: otpCode);
}
