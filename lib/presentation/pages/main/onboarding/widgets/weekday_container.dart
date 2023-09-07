import 'package:flutter/material.dart';

import '../../../../../gen/colors.gen.dart';

class WeekdayContainer extends StatelessWidget {
  const WeekdayContainer({
    required this.shortWeekday,
    required this.isSelected,
    this.isInvalid = false,
    super.key,
    this.height,
  });

  final String shortWeekday;
  final bool isSelected;
  final bool isInvalid;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected
            ? MintColors.stepperBlue
            : isInvalid
                ? MintColors.errorColor.withOpacity(0.4)
                : MintColors.brandBlue4,
      ),
      duration: const Duration(milliseconds: 200),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
        child: Center(
          child: Text(
            shortWeekday,
            style: TextStyle(
              fontSize: 14,
              color: isSelected ? Colors.white : Colors.black,
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
