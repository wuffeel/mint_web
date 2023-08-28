import 'package:flutter/material.dart';

import '../../../../../gen/colors.gen.dart';

class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        children: [
          TextSpan(text: 'Already have an Account?'),
          TextSpan(text: ' '),
          TextSpan(
            text: 'Sign in',
            style: TextStyle(
              color: MintColors.primaryBlueColor,
              decoration: TextDecoration.underline,
            ),
          )
        ],
      ),
      style: TextStyle(fontSize: 16),
    );
  }
}
