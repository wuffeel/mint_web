import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/verify_otp_use_case.dart';
import '../../../domain/usecase/verify_phone_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._verifyPhoneUseCase,
    this._verifyOtpUseCase,
  ) : super(AuthInitial()) {
    on<AuthVerifyPhoneRequested>(_onVerifyPhone);
    on<AuthVerifyOtpRequested>(_onVerifyOtp);
    on<AuthOtpResendRequested>(_onOtpResend);
  }

  final VerifyPhoneUseCase _verifyPhoneUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

  Future<void> _onVerifyPhone(
    AuthVerifyPhoneRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthVerifyPhoneLoading());
      await _verifyPhoneUseCase(phoneNumber: event.phoneNumber);
      emit(AuthVerifyPhoneSuccess(phoneNumber: event.phoneNumber));
    } catch (error) {
      if (kDebugMode) print('AuthVerifyPhoneFailure: $error');
      _handlePhoneVerificationFailure(error, emit);
    }
  }

  Future<void> _onVerifyOtp(
    AuthVerifyOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    final state = this.state;
    if (state is! AuthVerifyPhoneSuccess) return;

    try {
      emit(AuthVerifyOtpLoading(phoneNumber: state.phoneNumber));
      await _verifyOtpUseCase(otpCode: event.otpCode);
      emit(AuthVerifyOtpSuccess(phoneNumber: state.phoneNumber));
    } catch (error) {
      if (kDebugMode) print('AuthVerifyOtpFailure: $error');
      _handleOtpVerificationFailure(error, emit, state);
    }
  }

  Future<void> _onOtpResend(
    AuthOtpResendRequested event,
    Emitter<AuthState> emit,
  ) async {
    final state = this.state;
    if (state is! AuthVerifyPhoneSuccess) return;
    final phone = state.phoneNumber;

    try {
      emit(AuthOtpResendLoading(phoneNumber: phone));
      await _verifyPhoneUseCase(phoneNumber: phone);
      emit(AuthOtpResendSuccess(phoneNumber: phone));
    } catch (error) {
      if (kDebugMode) print('AuthOtpResendFailure: $error');
      emit(AuthOtpResendFailure(phoneNumber: phone));
    }
  }

  /// Handles phone verification failure and emits the appropriate state.
  ///
  /// If the error indicates an invalid phone number or too many requests, it
  /// emits [AuthVerifyPhoneInvalidNumber] or [AuthVerifyPhoneTooManyRequests]
  /// states respectively. Otherwise, it emits [AuthVerifyPhoneFailure].
  void _handlePhoneVerificationFailure(Object error, Emitter<AuthState> emit) {
    if (error.toString().contains('invalid-phone-number')) {
      emit(AuthVerifyPhoneInvalidNumber());
    } else if (error.toString().contains('too-many-requests')) {
      emit(AuthVerifyPhoneTooManyRequests());
    } else {
      emit(AuthVerifyPhoneFailure());
    }
  }

  /// Handles OTP verification failure and emits the appropriate state.
  ///
  /// Emits [AuthVerifyOtpMismatch] state if the error indicates an invalid
  /// verification code. Otherwise, it emits [AuthVerifyOtpFailure] state
  /// with information from the current [state].
  void _handleOtpVerificationFailure(
    Object error,
    Emitter<AuthState> emit,
    AuthVerifyPhoneSuccess state,
  ) {
    if (error.toString().contains('invalid-verification-code')) {
      emit(AuthVerifyOtpMismatch(phoneNumber: state.phoneNumber));
    } else {
      emit(AuthVerifyOtpFailure(phoneNumber: state.phoneNumber));
    }
  }
}
