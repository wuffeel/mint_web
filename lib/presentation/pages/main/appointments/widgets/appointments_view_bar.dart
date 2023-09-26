import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';

class AppointmentsViewBar extends StatelessWidget {
  const AppointmentsViewBar({
    required this.view,
    required this.onViewChange,
    super.key,
  });

  final CalendarView? view;
  final void Function(CalendarView) onViewChange;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Stack(
      children: <Widget>[
        Positioned.fill(
          bottom: 1,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 1,
              color: MintColors.appointmentsAppBarBorder,
            ),
          ),
        ),
        Row(
          children: <Widget>[
            _ViewTitle(
              view: CalendarView.month,
              title: l10n.overview,
              isSelected: view == CalendarView.month,
              onTap: onViewChange,
            ),
            const SizedBox(width: 100),
            _ViewTitle(
              view: CalendarView.day,
              title: l10n.day,
              isSelected: view == CalendarView.day,
              onTap: onViewChange,
            ),
            const SizedBox(width: 100),
            _ViewTitle(
              view: CalendarView.week,
              title: l10n.week,
              isSelected: view == CalendarView.week,
              onTap: onViewChange,
            ),
            const SizedBox(width: 100),
            _ViewTitle(
              view: CalendarView.schedule,
              title: l10n.schedule,
              isSelected: view == CalendarView.schedule,
              onTap: onViewChange,
            ),
          ],
        ),
      ],
    );
  }
}

class _ViewTitle extends StatelessWidget {
  const _ViewTitle({
    required this.view,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final CalendarView view;
  final String title;
  final bool isSelected;
  final void Function(CalendarView) onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        InkWell(
          onTap: () => onTap(view),
          child: Padding(
            padding: const EdgeInsets.all(11),
            child: Text(
              title,
              style: MintTextStyles.gilroyMedium16.copyWith(
                color: isSelected ? MintColors.primaryBlueColor : null,
              ),
            ),
          ),
        ),
        if (isSelected)
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 3,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: MintColors.primaryBlueColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
