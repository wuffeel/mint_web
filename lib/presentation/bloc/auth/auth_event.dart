part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthVerifyPhoneRequested extends AuthEvent {
  AuthVerifyPhoneRequested(this.phoneNumber);

  final String phoneNumber;
}

class AuthVerifyOtpRequested extends AuthEvent {
  AuthVerifyOtpRequested(this.otpCode);

  final String otpCode;
}

class AuthOtpResendRequested extends AuthEvent {}
