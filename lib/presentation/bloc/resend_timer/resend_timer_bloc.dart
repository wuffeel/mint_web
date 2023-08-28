import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'ticker.dart';

part 'resend_timer_event.dart';

part 'resend_timer_state.dart';

class ResendTimerBloc extends Bloc<ResendTimerEvent, ResendTimerState> {
  ResendTimerBloc({
    required Ticker ticker,
  })  : _ticker = ticker,
        super(const ResendTimerInitial(_duration)) {
    on<ResendTimerStartRequested>(_onStart);
    on<_TimerTicked>(_onTicked);
  }

  final Ticker _ticker;
  static const int _duration = 60;

  StreamSubscription<int>? _tickerSubscription;

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void _onStart(
    ResendTimerStartRequested event,
    Emitter<ResendTimerState> emit,
  ) {
    emit(const ResendTimerInProgress(_duration));
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: _duration)
        .listen((duration) => add(_TimerTicked(duration: duration)));
  }

  void _onTicked(_TimerTicked event, Emitter<ResendTimerState> emit) {
    emit(
      event.duration > 0
          ? ResendTimerInProgress(event.duration)
          : const ResendTimerComplete(),
    );
  }
}
