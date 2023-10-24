import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../widgets/mint_view_bar.dart';

class AppointmentsViewBar extends StatelessWidget {
  const AppointmentsViewBar({
    required this.onViewChange,
    required this.selectedView,
    super.key,
  });

  final CalendarView? selectedView;
  final void Function(CalendarView) onViewChange;

  List<MintViewBarItem<CalendarView>> _calendarViews(BuildContext context) {
    final l10n = context.l10n;
    return [
      MintViewBarItem(value: CalendarView.month, title: l10n.overview),
      MintViewBarItem(value: CalendarView.day, title: l10n.day),
      MintViewBarItem(value: CalendarView.week, title: l10n.week),
      MintViewBarItem(value: CalendarView.schedule, title: l10n.schedule),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MintViewBar(
      selectedView: selectedView,
      viewItems: _calendarViews(context),
      onViewChange: onViewChange,
    );
  }
}
