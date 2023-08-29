import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../bloc/resend_timer/resend_timer_bloc.dart';

class ResendOtpText extends StatelessWidget {
  const ResendOtpText({super.key});

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
    return BlocConsumer<AuthBloc, AuthState>(
      listener: _resendTimerListener,
      builder: (context, state) {
        final duration = context.select(
          (ResendTimerBloc bloc) => bloc.state.duration,
        );
        return Column(
          children: <Widget>[
            if (duration > 0)
              _ResendCodeTimer(duration: duration)
            else
              state is! AuthOtpResendLoading
                  ? InkWell(
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
                    )
                  : const Center(
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
            if (state is AuthOtpResendFailure) ...[
              const SizedBox(height: 8),
              Text(
                'Could not resend code. Try again',
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ]
          ],
        );
      },
    );
  }
}

class _ResendCodeTimer extends StatelessWidget {
  const _ResendCodeTimer({required this.duration});

  final int duration;

  String _toMinutes(int duration) =>
      ((duration / 60) % 60).floor().toString().padLeft(2, '0');

  String _toSeconds(int duration) => (duration % 60).toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final minutesStr = _toMinutes(duration);
    final secondsStr = _toSeconds(duration);
    return Text.rich(
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
    );
  }
}
