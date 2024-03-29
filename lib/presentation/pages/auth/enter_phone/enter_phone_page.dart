import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_bloc.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../router/app_router.gr.dart';
import '../../../../theme/mint_text_styles.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../widgets/scrollable_area.dart';
import '../widgets/auth_left_panel.dart';
import '../widgets/auth_page_body.dart';
import 'widgets/conditions_agree_text.dart';
import 'widgets/phone_field_error_decoration.dart';
import 'widgets/sign_in_text.dart';

@RoutePage()
class EnterPhonePage extends StatefulWidget {
  const EnterPhonePage({super.key});

  @override
  State<EnterPhonePage> createState() => _EnterPhonePageState();
}

class _EnterPhonePageState extends State<EnterPhonePage> {
  final _phoneController = TextEditingController();
  bool _isPhoneValid = false;

  VoidCallback? _getVerifyCallback(BuildContext context) {
    return _isPhoneValid
        ? () => _verifyPhone(context, _phoneController.text.trim())
        : null;
  }

  void _verifyPhone(BuildContext context, String phoneNumber) {
    context.read<AuthBloc>().add(AuthVerifyPhoneRequested(phoneNumber));
  }

  /// Validates the [phoneNumber] with universal phone number regex
  ///
  /// Used to check if "Sign Up" button should be available
  bool _validatePhoneNumber(String phoneNumber) {
    final regex = RegExp(
      r'^\(?(\+[0-9]{1,3})\)? ?-?[0-9]{1,3} ?-?[0-9]{3,5} ?-?[0-9]{4}'
      r'( ?-?[0-9]{3})? ?(\w{1,10}\s?\d{1,6})?$',
    );

    return regex.hasMatch(phoneNumber);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<AuthBloc, AuthState>(
      listenWhen: (oldState, newState) => oldState is! AuthVerifyPhoneSuccess,
      listener: (context, state) {
        if (state is AuthVerifyPhoneSuccess) {
          context.router.markUrlStateForReplace();
          context.router.push(const OtpRoute());
        }
      },
      builder: (context, state) => Scaffold(
        body: AuthPageBody(
          child: ScrollableArea(
            child: AuthLeftPanel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(l10n.signUp, style: MintTextStyles.title),
                  const SizedBox(height: 58),
                  PhoneFieldErrorDecoration(
                    borderRadius: BorderRadius.circular(8),
                    child: TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(hintText: l10n.phoneNumber),
                      onChanged: (phone) {
                        setState(() {
                          _isPhoneValid = _validatePhoneNumber(phone);
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 18),
                  if (state is! AuthVerifyPhoneLoading)
                    ElevatedButton(
                      onPressed: _getVerifyCallback(context),
                      child: Text(l10n.signUp),
                    )
                  else
                    const Center(child: CircularProgressIndicator()),
                  const SizedBox(height: 8),
                  const ConditionsAgreeText(),
                  const SizedBox(height: 70),
                  const Align(child: SignInText()),
                  const SizedBox(height: 50),
                  const _GoogleSignInButton(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GoogleSignInButton extends StatelessWidget {
  const _GoogleSignInButton();

  void _signInWithGoogle(BuildContext context) {
    context.read<GoogleAuthBloc>().add(GoogleAuthSignInRequested());
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _signInWithGoogle(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Assets.svg.googleIcon.svg(
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
            ),
            const SizedBox(width: 8),
            Text(
              context.l10n.signInWithGoogle,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
