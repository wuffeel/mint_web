import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/form_field_container.dart';
import 'availability_weekday_list.dart';
import 'onboarding_page_container.dart';

class AvailabilityWidget extends StatefulWidget {
  const AvailabilityWidget({
    required this.onBack,
    required this.onNext,
    required this.workInfo,
    required this.timeOfDayInfo,
    required this.onWorkInfoChange,
    required this.onTimeInfoChange,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback onNext;
  final Map<String, Map<String, String>> workInfo;
  final Map<String, Map<String, TimeOfDay?>?> timeOfDayInfo;
  final void Function(Map<String, Map<String, String>>) onWorkInfoChange;
  final void Function(Map<String, Map<String, TimeOfDay?>?>) onTimeInfoChange;

  @override
  State<AvailabilityWidget> createState() => _AvailabilityWidgetState();
}

class _AvailabilityWidgetState extends State<AvailabilityWidget> {
  /// Name for start time field to be stored in a work info map
  static String get _startTimeField => 'startTime';

  /// Name for end time field to be stored in a work info map
  static String get _endTimeField => 'endTime';

  var _workTimeInfo = <String, Map<String, String>>{};
  late Map<String, Map<String, TimeOfDay?>?> _timeOfDayInfo = {
    for (var item in _shortWeekdays)
      item: {
        _startTimeField: null,
        _endTimeField: null,
      }
  };

  final _shortWeekdays = <String>[
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
  ];
  final _weekdays = <String>[
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  late String _selectedWeekday = _shortWeekdays.first;

  void _setStartTime(String startTime) =>
      _workTimeInfo[_weekdays[_shortWeekdays.indexOf(
        _selectedWeekday,
      )]]?[_startTimeField] = startTime;

  void _setEndTime(String endTime) =>
      _workTimeInfo[_weekdays[_shortWeekdays.indexOf(
        _selectedWeekday,
      )]]?[_endTimeField] = endTime;

  String? _to12HourString(TimeOfDay? time) {
    if (time == null) return null;
    return DateFormat.jm('en_US').format(
      DateTime(1, 1, 1, time.hour, time.minute),
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.timeOfDayInfo.isNotEmpty) _timeOfDayInfo = widget.timeOfDayInfo;
    if (widget.workInfo.isNotEmpty) _workTimeInfo = widget.workInfo;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final onWorkInfoChange = widget.onWorkInfoChange;
    final onTimeInfoChange = widget.onTimeInfoChange;
    final startTimeOfDay =
        widget.timeOfDayInfo[_selectedWeekday]?[_startTimeField];
    final endTimeOfDay = widget.timeOfDayInfo[_selectedWeekday]?[_endTimeField];
    return OnboardingPageContainer(
      title: l10n.yourAvailability,
      subTitle: l10n.pleaseProvideYourGeneralAvailability,
      onBack: widget.onBack,
      onNext: widget.onNext,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AvailabilityWeekdayList(
            selectedWeekday: _selectedWeekday,
            shortWeekdays: _shortWeekdays,
            onWeekdaySelect: (weekday) => setState(
              () => _selectedWeekday = weekday,
            ),
          ),
          const SizedBox(height: 28),
          _AvailabilityTimePicker(
            time: startTimeOfDay,
            timeToString: _to12HourString,
            onTimeChange: (startTime, startTimeString) {
              setState(() {
                _timeOfDayInfo[_selectedWeekday]?[_startTimeField] = startTime;
                if (startTimeString != null) _setStartTime(startTimeString);
              });
              onTimeInfoChange(_timeOfDayInfo);
              onWorkInfoChange(_workTimeInfo);
            },
            hintText: l10n.startTime,
          ),
          const SizedBox(height: 16),
          _AvailabilityTimePicker(
            time: endTimeOfDay,
            timeToString: _to12HourString,
            onTimeChange: (endTime, endTimeString) {
              setState(() {
                _timeOfDayInfo[_selectedWeekday]?[_endTimeField] = endTime;
                if (endTimeString != null) _setEndTime(endTimeString);
              });
              onTimeInfoChange(_timeOfDayInfo);
              onWorkInfoChange(_workTimeInfo);
            },
            hintText: l10n.endTime,
          ),
        ],
      ),
    );
  }
}

class _AvailabilityTimePicker extends StatelessWidget {
  const _AvailabilityTimePicker({
    required this.time,
    required this.timeToString,
    required this.onTimeChange,
    required this.hintText,
  });

  final TimeOfDay? time;
  final String? Function(TimeOfDay?) timeToString;
  final void Function(TimeOfDay, String?) onTimeChange;
  final String hintText;

  Future<TimeOfDay?> _showTimePicker(BuildContext context) {
    return showTimePicker(
      context: context,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      initialTime: time ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );
  }

  @override
  Widget build(BuildContext context) {
    final timeTo12Hour = timeToString;
    return InkWell(
      onTap: () async {
        final time = await _showTimePicker(context);
        if (time == null) return;
        onTimeChange(time, timeTo12Hour(time));
      },
      child: FormFieldContainer(
        child: SizedBox(
          width: double.infinity,
          child: Text(
            timeTo12Hour(time) ?? hintText,
            style: MintTextStyles.body.copyWith(
              color: time == null
                  ? Theme.of(context).hintColor.withOpacity(0.3)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
