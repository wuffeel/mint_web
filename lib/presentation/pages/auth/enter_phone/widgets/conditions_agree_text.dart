import 'package:flutter/material.dart';

class ConditionsAgreeText extends StatelessWidget {
  const ConditionsAgreeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'By tapping “Sign up”, you have read and agree to the',
            style: TextStyle(
              fontSize: 14,
              height: 1.2,
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          ),
          const TextSpan(text: ' '),
          const TextSpan(
            text: 'Mint Terms & Conditions and Privacy Policy',
            style: TextStyle(
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
