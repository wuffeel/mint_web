import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../l10n/l10n.dart';
import '../../../../theme/mint_gradient.dart';
import '../../../../theme/mint_text_styles.dart';

class AuthRightPanel extends StatelessWidget {
  const AuthRightPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                gradient: MintGradient.authGradient,
              ),
            ),
            Align(
              child: Text(
                l10n.signUpToManageAndConsult,
                style: MintTextStyles.sfProDisplay.copyWith(
                  fontSize: 30,
                  height: 1.15,
                  color: Colors.white.withOpacity(0.8),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              top: -196,
              left: -207,
              child: _MintLogoTransparent(
                size: (constraints.maxWidth * 0.56).clamp(350, double.infinity),
              ),
            ),
            Positioned(
              right: -138,
              bottom: -39,
              child: _MintLogoTransparent(
                size: (constraints.maxWidth * 0.49).clamp(250, double.infinity),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _MintLogoTransparent extends StatelessWidget {
  const _MintLogoTransparent({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Assets.svg.mintLogo.svg(
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        Colors.white.withOpacity(0.07),
        BlendMode.srcIn,
      ),
    );
  }
}
