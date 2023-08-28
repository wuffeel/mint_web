import 'package:flutter/material.dart';

import '../../../widgets/mint_logo.dart';
import 'auth_left_panel_container.dart';

class AuthLeftPanelWithLogo extends StatelessWidget {
  const AuthLeftPanelWithLogo({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AuthLeftPanelContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 30),
          const MintLogo(),
          const Spacer(flex: 3),
          child,
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
