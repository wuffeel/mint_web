import 'package:flutter/material.dart';

class TextFieldErrorDecoration extends StatelessWidget {
  const TextFieldErrorDecoration({
    required this.child,
    super.key,
    this.errorText,
    this.borderRadius,
  });

  final Widget child;
  final String? errorText;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final error = errorText;
    return error != null
        ? Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _ErrorDecoration(borderRadius: borderRadius, child: child),
              const SizedBox(height: 8),
              Text(
                error,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
          )
        : _ErrorDecoration(borderRadius: borderRadius, child: child);
  }
}

class _ErrorDecoration extends StatelessWidget {
  const _ErrorDecoration({required this.child, this.borderRadius});

  final Widget child;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.error),
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
