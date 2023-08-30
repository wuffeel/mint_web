import 'package:flutter/material.dart';

import '../../../../../gen/colors.gen.dart';

class AvailabilityWeekdayList extends StatelessWidget {
  const AvailabilityWeekdayList({
    required this.selectedWeekday,
    required this.shortWeekdays,
    required this.onWeekdaySelect,
    super.key,
  });

  final String selectedWeekday;
  final List<String> shortWeekdays;
  final void Function(String) onWeekdaySelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        shortWeekdays.length,
        (index) {
          final weekday = shortWeekdays[index];
          return InkWell(
            onTap: () => onWeekdaySelect(weekday),
            child: _WeekdayContainer(
              shortWeekday: weekday,
              isSelected: weekday == selectedWeekday,
              size: 48,
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
    required this.size,
  });

  final String shortWeekday;
  final bool isSelected;
  final double size;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? MintColors.stepperBlue : MintColors.brandBlue4,
      ),
      child: SizedBox(
        height: size,
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
      ),
    );
  }
}
