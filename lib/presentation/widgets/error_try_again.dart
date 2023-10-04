import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import 'try_again_button.dart';

class ErrorTryAgain extends StatelessWidget {
  const ErrorTryAgain({
    super.key,
    this.onRefresh,
    this.errorText,
    this.titleStyle,
    this.tryAgainStyle,
  });

  /// Error title to be shown. Defaults to 'Oops, something went wrong!'.
  final String? errorText;

  /// Callback on 'Try again' button tap. If null, button won't be shown.
  final VoidCallback? onRefresh;

  final TextStyle? titleStyle;
  final TextStyle? tryAgainStyle;

  @override
  Widget build(BuildContext context) {
    final refreshCallback = onRefresh;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          errorText ?? '${context.l10n.oopsSomethingWentWrong}!',
          style: titleStyle ??
              const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
        ),
        if (refreshCallback != null) ...[
          const SizedBox(height: 8),
          TryAgainButton(
            onRefresh: refreshCallback,
            tryAgainStyle: tryAgainStyle,
          ),
        ],
      ],
    );
  }
}
