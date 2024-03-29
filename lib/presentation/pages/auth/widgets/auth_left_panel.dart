import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../widgets/mint_back_button.dart';
import '../../../widgets/mint_logo.dart';
import 'auth_left_panel_container.dart';

class AuthLeftPanel extends StatelessWidget {
  const AuthLeftPanel({
    required this.child,
    super.key,
    this.hasLogo = true,
    this.onBack,
    this.forceBackButton = false,
  });

  final Widget child;
  final bool hasLogo;
  final VoidCallback? onBack;
  final bool forceBackButton;

  @override
  Widget build(BuildContext context) {
    return AuthLeftPanelContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          if (hasLogo) const MintLogo(),
          if (context.router.canPop() || forceBackButton) ...[
            const SizedBox(height: 8),
            MintBackButton(onBack: onBack),
          ],
          const SizedBox(height: 30),
          const Spacer(flex: 3),
          child,
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
