part of 'resend_timer_bloc.dart';

@immutable
class ResendTimerState {
  const ResendTimerState(this.duration);

  final int duration;
}

class ResendTimerInitial extends ResendTimerState {
  const ResendTimerInitial(super.duration);
}

class ResendTimerInProgress extends ResendTimerInitial {
  const ResendTimerInProgress(super.duration);
}

class ResendTimerComplete extends ResendTimerInProgress {
  const ResendTimerComplete() : super(0);
}
