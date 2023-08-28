import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bloc/resend_timer/resend_timer_bloc.dart';

class ResendOtpText extends StatelessWidget {
  const ResendOtpText({super.key});

  String _toMinutes(int duration) =>
      ((duration / 60) % 60).floor().toString().padLeft(2, '0');

  String _toSeconds(int duration) => (duration % 60).toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final duration = context.select(
      (ResendTimerBloc bloc) => bloc.state.duration,
    );
    final minutesStr = _toMinutes(duration);
    final secondsStr = _toSeconds(duration);
    return duration > 0
        ? Text(
            '$minutesStr:$secondsStr',
            style: TextStyle(
              fontSize: 14,
              height: 1.1,
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          )
        : TextButton(
            onPressed: () {
              context.read<ResendTimerBloc>().add(ResendTimerStartRequested());
            },
            child: const Text('Resend code'),
          );
  }
}
