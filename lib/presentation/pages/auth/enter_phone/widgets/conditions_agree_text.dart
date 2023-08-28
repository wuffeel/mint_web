import 'package:flutter/material.dart';

import '../../../../../l10n/l10n.dart';

class ConditionsAgreeText extends StatelessWidget {
  const ConditionsAgreeText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: l10n.byTappingSignUpYouAgree,
            style: TextStyle(
              fontSize: 14,
              height: 1.2,
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: l10n.mintTermsAndConditions,
            style: const TextStyle(
              fontSize: 14,
              height: 1.2,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
