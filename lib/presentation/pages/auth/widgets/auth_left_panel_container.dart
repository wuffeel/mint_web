import 'package:flutter/material.dart';

class AuthLeftPanelContainer extends StatelessWidget {
  const AuthLeftPanelContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.65,
      child: child,
    );
  }
}
