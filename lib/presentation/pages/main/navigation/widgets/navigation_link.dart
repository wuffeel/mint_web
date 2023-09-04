import 'package:flutter/material.dart';

import '../../../../../gen/colors.gen.dart';

class NavigationLink extends StatelessWidget {
  const NavigationLink({
    required this.title,
    required this.isCurrent,
    required this.onTap,
    super.key,
  });

  final String title;
  final bool isCurrent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          InkWell(
            onTap: onTap,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isCurrent ? MintColors.primaryBlueColor : null,
              ),
            ),
          ),
          if (isCurrent)
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(height: 2, color: MintColors.primaryBlueColor),
              ),
            )
        ],
      ),
    );
  }
}
