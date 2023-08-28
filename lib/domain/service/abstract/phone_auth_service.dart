abstract class PhoneAuthService {
  Future<void> verifyPhoneNumber({required String phoneNumber});

  Future<void> verifyOtpCode({required String otpCode});
}
