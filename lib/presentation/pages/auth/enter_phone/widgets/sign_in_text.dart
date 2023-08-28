import 'package:flutter/material.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${l10n.alreadyHaveAnAccount}?'),
          const TextSpan(text: ' '),
          TextSpan(
            text: l10n.signIn,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: MintColors.primaryBlueColor,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
