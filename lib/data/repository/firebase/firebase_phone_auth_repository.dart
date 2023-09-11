import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_module.dart';

import '../abstract/phone_auth_repository.dart';

@LazySingleton(as: PhoneAuthRepository)
class FirebasePhoneAuthRepository implements PhoneAuthRepository {
  FirebasePhoneAuthRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;

  ConfirmationResult? _confirmationResult;

  @override
  Future<void> verifyPhoneNumber({
    required String phoneNumber,
  }) async {
    final firebaseAuth = await _firebaseInitializer.firebaseAuth;

    _confirmationResult = await firebaseAuth.signInWithPhoneNumber(phoneNumber);
  }

  @override
  Future<void> verifyOtpCode({required String otpCode}) async {
    final confirmationResult = _confirmationResult;
    if (confirmationResult == null) {
      throw ArgumentError(
          'Null error: the ConfirmationResult has a null value. Can not '
          'proceed OTP code confirmation.');
    }

    await confirmationResult.confirm(otpCode);
  }
}
