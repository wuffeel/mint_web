import 'package:flutter/material.dart';

import '../../../../../gen/colors.gen.dart';

class AvailabilityWeekdayList extends StatelessWidget {
  const AvailabilityWeekdayList({
    required this.currentWeekday,
    required this.shortWeekdays,
    required this.onWeekdaySelect,
    super.key,
  });

  final int currentWeekday;
  final List<String> shortWeekdays;
  final void Function(int) onWeekdaySelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        shortWeekdays.length,
        (index) {
          final shortWeekday = shortWeekdays[index];
          return InkWell(
            onTap: () => onWeekdaySelect(index),
            child: _WeekdayContainer(
              shortWeekday: shortWeekday,
              isSelected: index == currentWeekday,
              height: 48,
            ),
          );
        },
      ),
    );
  }
}

class _WeekdayContainer extends StatelessWidget {
  const _WeekdayContainer({
    required this.shortWeekday,
    required this.isSelected,
    required this.height,
  });

  final String shortWeekday;
  final bool isSelected;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? MintColors.stepperBlue : MintColors.brandBlue4,
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
