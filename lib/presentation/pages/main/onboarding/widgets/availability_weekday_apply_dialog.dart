import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entity/onboarding/onboarding.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../../utils/time_of_day_to_string.dart';
import 'availability_multi_select_list.dart';

class AvailabilityWeekdayApplyDialog extends StatelessWidget {
  const AvailabilityWeekdayApplyDialog({
    required this.startTime,
    required this.endTime,
    required this.shortWeekdays,
    required this.workDayFormList,
    required this.currentIndex,
    super.key,
  });

  final TimeOfDay? startTime;
  final TimeOfDay? endTime;
  final List<String> shortWeekdays;
  final List<WorkDayInfoForm> workDayFormList;
  final int currentIndex;

  String _getScheduleString(
    BuildContext context,
    TimeOfDay? startTime,
    TimeOfDay? endTime,
  ) {
    final l10n = context.l10n;
    var schedule = '${l10n.schedule}: ';
    final start = startTime?.toTimeString;
    final end = endTime?.toTimeString;
    if (start != null && end != null) {
      return schedule += '$start-$end';
    } else if (start != null) {
      return schedule += '${l10n.start.toLowerCase()} - $start';
    } else if (end != null) {
      return schedule += '${l10n.end.toLowerCase()} - $end';
    }
    return schedule;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.selectDaysToApply),
      content: Wrap(
        children: <Widget>[
          SizedBox(
            width: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _getScheduleString(context, startTime, endTime),
                  style: MintTextStyles.body,
                ),
                const SizedBox(height: 20),
                AvailabilityMultiSelectList(
                  shortWeekdays: List<String>.from(shortWeekdays)
                    ..removeAt(currentIndex),
                  onApply: (weekdays) {
                    if (weekdays.isEmpty) return;
                    for (final weekday in weekdays) {
                      final index = shortWeekdays.indexOf(weekday);
                      final form = workDayFormList[index];
                      form.startTimeControl?.value = startTime;
                      form.endTimeControl?.value = endTime;
                    }
                    context.router.pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
