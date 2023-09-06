import 'package:flutter/material.dart';

import '../../../../../utils/extended_widget_list.dart';
import 'weekday_container.dart';

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
          return Expanded(
            child: InkWell(
              onTap: () => onWeekdaySelect(index),
              child: WeekdayContainer(
                shortWeekday: shortWeekday,
                isSelected: index == currentWeekday,
                height: 48,
              ),
            ),
          );
        },
      )..insertBetween(const SizedBox(width: 20)),
    );
  }
}
