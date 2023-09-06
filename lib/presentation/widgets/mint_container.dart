import 'package:flutter/material.dart';

class MintContainer extends StatelessWidget {
  const MintContainer({
    required this.child,
    super.key,
    this.width,
    this.height,
  });

  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        child: SizedBox(width: width, height: height, child: child),
      ),
    );
  }
}
