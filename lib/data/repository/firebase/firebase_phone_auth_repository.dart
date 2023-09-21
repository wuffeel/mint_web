import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../abstract/phone_auth_repository.dart';

@LazySingleton(as: PhoneAuthRepository)
class FirebasePhoneAuthRepository implements PhoneAuthRepository {
  FirebasePhoneAuthRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;

  ConfirmationResult? _confirmationResult;

  Future<CollectionReference<Map<String, dynamic>>>
      get _usersCollectionRef async =>
          (await _firebaseInitializer.firestore).collection('users');

  @override
  Future<void> verifyPhoneNumber({required String phoneNumber}) async {
    await _checkForValidUserType(phoneNumber);

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

  /// Checks if the user associated with [phoneNumber] in Firestore has the
  /// correct user type. If there is no user with [phoneNumber], does nothing.
  ///
  /// For web application, the correct user type is __'specialist'__.
  /// Throws an [AuthUserTypeException] if the user type is incorrect.
  Future<void> _checkForValidUserType(String phoneNumber) async {
    final userCollection = await _usersCollectionRef;
    final userSnap =
        await userCollection.where('phoneNumber', isEqualTo: phoneNumber).get();
    if (userSnap.docs.isNotEmpty) {
      final user = userSnap.docs.first;
      final type = user.data()['type'];
      if (type != UserType.specialist.name) throw AuthUserTypeException();
    }
  }
}
