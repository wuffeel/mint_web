import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../bloc/resend_timer/resend_timer_bloc.dart';

class ResendOtpText extends StatelessWidget {
  const ResendOtpText({super.key});

  String _toMinutes(int duration) =>
      ((duration / 60) % 60).floor().toString().padLeft(2, '0');

  String _toSeconds(int duration) => (duration % 60).toString().padLeft(2, '0');

  void _resendTimerListener(BuildContext context, AuthState state) {
    if (state is AuthOtpResendSuccess) {
      context.read<ResendTimerBloc>().add(ResendTimerStartRequested());
    }
  }

  void _resendCode(BuildContext context) {
    context.read<AuthBloc>().add(AuthOtpResendRequested());
  }

  @override
  Widget build(BuildContext context) {
    final duration = context.select(
      (ResendTimerBloc bloc) => bloc.state.duration,
    );
    final minutesStr = _toMinutes(duration);
    final secondsStr = _toSeconds(duration);
    return BlocListener<AuthBloc, AuthState>(
      listener: _resendTimerListener,
      child: duration > 0
          ? Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: context.l10n.youWillBeAbleToResendCodeIn,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.1,
                      color: Theme.of(context).hintColor.withOpacity(0.6),
                    ),
                  ),
                  TextSpan(
                    text: ' $minutesStr:$secondsStr',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.1,
                      color: Theme.of(context).hintColor.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            )
          : InkWell(
              onTap: () => _resendCode(context),
              child: Text(
                context.l10n.resendCode,
                style: const TextStyle(
                  fontSize: 13,
                  height: 1.3,
                  fontWeight: FontWeight.w500,
                  color: MintColors.primaryBlueColor,
                ),
              ),
            ),
    );
  }
}
