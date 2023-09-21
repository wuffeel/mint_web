part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthPhoneNotEntered extends AuthState {}

class AuthVerifyPhoneFailure extends AuthState {}

class AuthVerifyPhoneInvalidNumber extends AuthState {}

class AuthVerifyPhoneWrongUserType extends AuthState {}

class AuthVerifyPhoneTooManyRequests extends AuthState {}

class AuthVerifyPhoneLoading extends AuthState {}

class AuthVerifyPhoneSuccess extends AuthState {
  AuthVerifyPhoneSuccess({required this.phoneNumber});

  final String phoneNumber;
}

class AuthVerifyOtpLoading extends AuthVerifyPhoneSuccess {
  AuthVerifyOtpLoading({required super.phoneNumber});
}

class AuthVerifyOtpSuccess extends AuthVerifyPhoneSuccess {
  AuthVerifyOtpSuccess({required super.phoneNumber});
}

class AuthVerifyOtpMismatch extends AuthVerifyPhoneSuccess {
  AuthVerifyOtpMismatch({required super.phoneNumber});
}

class AuthVerifyOtpFailure extends AuthVerifyPhoneSuccess {
  AuthVerifyOtpFailure({required super.phoneNumber});
}

class AuthOtpResendLoading extends AuthVerifyPhoneSuccess {
  AuthOtpResendLoading({required super.phoneNumber});
}

class AuthOtpResendSuccess extends AuthVerifyPhoneSuccess {
  AuthOtpResendSuccess({required super.phoneNumber});
}

class AuthOtpResendFailure extends AuthVerifyPhoneSuccess {
  AuthOtpResendFailure({required super.phoneNumber});
}
