import 'package:flutter/material.dart';

class ScrollableArea extends StatelessWidget {
  const ScrollableArea({required this.child, super.key});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverFillRemaining(
          hasScrollBody: false,
          child: child,
        ),
      ],
    );
  }
}
