import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class PopupAppBar extends StatelessWidget {
  const PopupAppBar({
    super.key,
    this.title,
    this.actions,
    this.padding,
    this.backgroundColor,
  });

  final Widget? title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      // Border is not drawn with either Ink or DecoratedBox
      // ignore: use_decorated_box
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          elevation: 0,
          leading: IconButton(
            onPressed: context.router.pop,
            icon: Assets.svg.crossIcon.svg(
              width: 24,
              height: 24,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                MintColors.dark,
                BlendMode.srcIn,
              ),
            ),
            splashRadius: 24,
          ),
          title: title,
          actions: actions,
          backgroundColor: backgroundColor,
        ),
      ),
    );
  }
}
