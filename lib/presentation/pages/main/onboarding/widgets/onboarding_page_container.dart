import 'package:flutter/material.dart';

import '../../../../../l10n/l10n.dart';
import '../../../auth/widgets/auth_left_panel.dart';
import 'onboarding_title.dart';

class OnboardingPageContainer extends StatelessWidget {
  const OnboardingPageContainer({
    required this.title,
    required this.subTitle,
    required this.onNext,
    required this.child,
    this.forceBackButton = true,
    this.hasCustomNextButton = false,
    this.onBack,
    super.key,
  });

  final String title;
  final String subTitle;
  final VoidCallback? onNext;
  final Widget child;
  final bool forceBackButton;
  final VoidCallback? onBack;
  final bool hasCustomNextButton;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: AuthLeftPanel(
            hasLogo: false,
            forceBackButton: forceBackButton,
            onBack: onBack,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                OnboardingTitle(
                  title: title,
                  subTitle: subTitle,
                ),
                const SizedBox(height: 34),
                child,
                if (!hasCustomNextButton) ...[
                  const SizedBox(height: 50),
                  ElevatedButton(onPressed: onNext, child: Text(l10n.next)),
                  const SizedBox(height: 30),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
