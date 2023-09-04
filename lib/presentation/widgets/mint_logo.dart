import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../theme/mint_text_styles.dart';

class MintLogo extends StatelessWidget {
  const MintLogo({super.key, this.onTap, this.padding});

  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Row(
          children: <Widget>[
            Assets.svg.mintLogo.svg(
              width: 30,
              height: 30,
              colorFilter: const ColorFilter.mode(
                MintColors.primaryBlueColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 2),
            const Text('mint', style: MintTextStyles.logo),
          ],
        ),
      ),
    );
  }
}
