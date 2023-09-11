import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class SvgIconWidget extends StatelessWidget {
  const SvgIconWidget(
    this.genImage, {
    super.key,
    this.fit = BoxFit.scaleDown,
    this.width = 24,
    this.height = 24,
    this.color,
  });

  final SvgGenImage genImage;
  final BoxFit fit;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return genImage.svg(
      width: width,
      height: height,
      fit: fit,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).iconTheme.color ?? Colors.black,
        BlendMode.srcIn,
      ),
    );
  }
}
