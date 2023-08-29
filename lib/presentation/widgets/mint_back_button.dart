import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../l10n/l10n.dart';

class MintBackButton extends StatelessWidget {
  const MintBackButton({super.key, this.onBack, this.color});

  final VoidCallback? onBack;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBack ?? context.router.back,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Assets.svg.backButton.svg(
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(
              color ?? Colors.black,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            context.l10n.back,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
