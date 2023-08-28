part of 'resend_timer_bloc.dart';

@immutable
abstract class ResendTimerEvent {}

class ResendTimerStartRequested extends ResendTimerEvent {}

class _TimerTicked extends ResendTimerEvent {
  _TimerTicked({required this.duration});

  final int duration;
}
