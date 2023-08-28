import 'package:flutter/material.dart';

import 'auth_right_panel.dart';

class AuthPageBody extends StatelessWidget {
  const AuthPageBody({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: child),
        const Expanded(child: AuthRightPanel())
      ],
    );
  }
}
