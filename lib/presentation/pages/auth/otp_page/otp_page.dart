import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../l10n/l10n.dart';
import '../../../../theme/mint_text_styles.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../bloc/resend_timer/resend_timer_bloc.dart';
import '../../../bloc/resend_timer/ticker.dart';
import '../../../bloc/user/user_bloc.dart';
import '../widgets/auth_left_panel_with_logo.dart';
import '../widgets/auth_page_body.dart';
import 'widgets/otp_field_error_decoration.dart';
import 'widgets/otp_sent_text.dart';
import 'widgets/resend_otp_text.dart';

@RoutePage()
class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResendTimerBloc(ticker: const Ticker())
        ..add(ResendTimerStartRequested()),
      child: const _OtpView(),
    );
  }
}

class _OtpView extends StatefulWidget {
  const _OtpView();

  @override
  State<_OtpView> createState() => _OtpPageState();
}

class _OtpPageState extends State<_OtpView> {
  final _otpController = TextEditingController();

  void _resetPhone() {
    context.read<AuthBloc>().add(AuthPhoneChangeRequested());
  }

  void _verifyOtp(String otpCode) {
    context.read<AuthBloc>().add(AuthVerifyOtpRequested(otpCode));
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return AuthPageBody(
            child: AuthLeftPanelWithLogo(
              onBack: _resetPhone,
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, userState) {
                  if (userState is UserFetchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.enterCode, style: MintTextStyles.title),
                      const SizedBox(height: 8),
                      if (state is AuthVerifyPhoneSuccess)
                        OtpSentText(phoneNumber: state.phoneNumber),
                      const SizedBox(height: 34),
                      OtpFieldErrorDecoration(
                        borderRadius: BorderRadius.circular(8),
                        child: TextField(
                          controller: _otpController,
                          decoration: InputDecoration(hintText: l10n.enterCode),
                          onChanged: (_) => setState(() {}),
                        ),
                      ),
                      const SizedBox(height: 18),
                      if (state is! AuthVerifyOtpLoading)
                        ElevatedButton(
                          onPressed: _otpController.text.isNotEmpty
                              ? () => _verifyOtp(_otpController.text.trim())
                              : null,
                          child: Text(l10n.signUp),
                        )
                      else
                        const Center(child: CircularProgressIndicator()),
                      const SizedBox(height: 8),
                      if (state is! AuthVerifyOtpLoading &&
                          state is! AuthVerifyOtpSuccess)
                        const Align(child: ResendOtpText()),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
