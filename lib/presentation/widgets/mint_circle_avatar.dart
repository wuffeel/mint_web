import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class MintCircleAvatar extends StatelessWidget {
  const MintCircleAvatar({
    required this.radius,
    required this.backgroundColor,
    super.key,
    this.photoUrl,
    this.iconColor,
  });

  final double radius;
  final Color backgroundColor;
  final String? photoUrl;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final photo = photoUrl;
    return photo != null
        ? CircleAvatar(
            radius: radius,
            backgroundImage: NetworkImage(photo),
            backgroundColor: backgroundColor,
          )
        : CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor,
            child: Assets.svg.userPlaceholder.svg(
              width: radius,
              height: radius,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                iconColor ?? Theme.of(context).primaryColor,
                BlendMode.srcIn,
              ),
            ),
          );
  }
}
