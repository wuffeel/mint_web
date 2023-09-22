import 'package:flutter/material.dart';
import 'package:mint_core/mint_utils.dart';

import 'weekday_container.dart';

class AvailabilityWeekdayList extends StatelessWidget {
  const AvailabilityWeekdayList({
    required this.currentWeekday,
    required this.shortWeekdays,
    required this.onWeekdaySelect,
    required this.invalidWeekdayPredicate,
    required this.validWeekdayPredicate,
    super.key,
  });

  final int currentWeekday;
  final List<String> shortWeekdays;
  final void Function(int) onWeekdaySelect;
  final bool Function(int) invalidWeekdayPredicate;
  final bool Function(int) validWeekdayPredicate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        shortWeekdays.length,
        (index) {
          final shortWeekday = shortWeekdays[index];
          return Expanded(
            child: InkWell(
              onTap: () => onWeekdaySelect(index),
              child: WeekdayContainer(
                shortWeekday: shortWeekday,
                isSelected: index == currentWeekday,
                isInvalid: invalidWeekdayPredicate(index),
                isValid: validWeekdayPredicate(index),
                height: 48,
              ),
            ),
          );
        },
      )..insertBetween(const SizedBox(width: 20)),
    );
  }
}
