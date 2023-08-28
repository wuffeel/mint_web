part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthVerifyPhoneFailure extends AuthState {}

class AuthVerifyPhoneInvalidNumber extends AuthState {}

class AuthVerifyPhoneTooManyRequests extends AuthState {}

class AuthVerifyPhoneSuccess extends AuthState {
  AuthVerifyPhoneSuccess({required this.phoneNumber});

  final String phoneNumber;
}

class AuthVerifyOtpFailure extends AuthVerifyPhoneSuccess {
  AuthVerifyOtpFailure({required super.phoneNumber});
}

class AuthVerifyOtpMismatch extends AuthVerifyPhoneSuccess {
  AuthVerifyOtpMismatch({required super.phoneNumber});
}

class AuthVerifyOtpSuccess extends AuthState {}
