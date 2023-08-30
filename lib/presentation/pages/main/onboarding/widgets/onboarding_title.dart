import 'package:flutter/material.dart';

import '../../../../../theme/mint_text_styles.dart';

class OnboardingTitle extends StatelessWidget {
  const OnboardingTitle({
    required this.title,
    required this.subTitle,
    super.key,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: MintTextStyles.title),
        const SizedBox(height: 8),
        Text(
          subTitle,
          style: TextStyle(
            color: Theme.of(context).hintColor.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
