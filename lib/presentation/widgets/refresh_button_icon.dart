import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class RefreshButtonIcon extends StatelessWidget {
  const RefreshButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Assets.svg.refreshIcon.svg(
      width: 26,
      height: 26,
      colorFilter: const ColorFilter.mode(
        MintColors.primaryBlueColor,
        BlendMode.srcIn,
      ),
    );
  }
}
