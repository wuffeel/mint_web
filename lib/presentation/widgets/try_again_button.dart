import 'package:flutter/material.dart';

import '../../l10n/l10n.dart';
import 'refresh_button_icon.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({
    required this.onRefresh,
    super.key,
    this.tryAgainStyle,
  });

  final VoidCallback onRefresh;
  final TextStyle? tryAgainStyle;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      onTap: onRefresh,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            context.l10n.tryAgain,
            style: tryAgainStyle ?? TextStyle(
              fontSize: 20,
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          ),
          const SizedBox(width: 8),
          const RefreshButtonIcon(),
        ],
      ),
    );
  }
}
