import 'package:injectable/injectable.dart';

import '../../../data/repository/abstract/phone_auth_repository.dart';
import '../abstract/phone_auth_service.dart';

@Injectable(as: PhoneAuthService)
class FirebasePhoneAuthService implements PhoneAuthService {
  FirebasePhoneAuthService(this._phoneAuthRepository);

  final PhoneAuthRepository _phoneAuthRepository;

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    int? resendToken,
  }) {
    return _phoneAuthRepository.verifyPhoneNumber(phoneNumber: phoneNumber);
  }

  @override
  Future<void> verifyOtpCode({required String otpCode}) {
    return _phoneAuthRepository.verifyOtpCode(otpCode: otpCode);
  }
}
