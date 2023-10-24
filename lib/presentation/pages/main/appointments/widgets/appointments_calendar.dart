import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../../../domain/entity/patient_book/patient_book.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import 'appointment_card.dart';

class AppointmentsCalendar extends StatelessWidget {
  const AppointmentsCalendar({
    required this.controller,
    required this.bookingList,
    required this.focusedDate,
    required this.onFocusedDateChange,
    required this.blackoutDates,
    super.key,
  });

  final CalendarController controller;
  final List<PatientBook> bookingList;
  final DateTime? focusedDate;
  final void Function(DateTime) onFocusedDateChange;

  /// See [SfCalendar.blackoutDates]
  final List<DateTime> blackoutDates;

  /// Converts elements of [bookingList] to [Appointment] list.
  List<Appointment> _bookingToAppointmentList(BuildContext context) {
    return bookingList.map((book) {
      final fullName = book.firstName != null && book.lastName != null
          ? '${book.firstName} ${book.lastName}'
          : context.l10n.patient;
      return Appointment(
        id: book.id,
        startTime: book.bookTime,
        endTime: book.endTime,
        subject: fullName,
        notes: book.notes,
      );
    }).toList();
  }

  /// Handles a tap event on the calendar element and updates the [controller]'s
  /// view property accordingly.
  void _onCalendarTap(CalendarTapDetails details) {
    final view = controller.view;
    final targetElement = details.targetElement;

    final isCalendarCell = targetElement == CalendarElement.calendarCell;
    final isAppointmentTap = targetElement == CalendarElement.appointment;

    final date = details.date;
    if (date != null) onFocusedDateChange(date);

    if (view == CalendarView.month && isCalendarCell) {
      controller.view = CalendarView.day;
      if (date != null) _setControllerDate(date);
    } else if (view != CalendarView.schedule && isAppointmentTap) {
      controller.view = CalendarView.schedule;
      if (date != null) _setControllerDate(date);
    }
  }

  /// Updates the 'selectedDate' and 'displayDate' properties of [controller]
  /// with the date-without-time data of [date].
  void _setControllerDate(DateTime date) {
    final now = DateTime.now();
    final newDate = DateTime(date.year, date.month, date.day);
    controller
      ..selectedDate = newDate
      ..displayDate = newDate.copyWith(
        hour: now.hour,
        minute: now.minute,
        second: now.second,
      );
  }

  /// Checks if appointment startTime from [details] is the same as
  /// [focusedDate].
  bool _isFocusedAppointment(CalendarAppointmentDetails details) {
    final focusedDate = this.focusedDate;
    if (details.appointments.isEmpty || focusedDate == null) return false;
    final appointment = details.appointments.first as Appointment;
    return appointment.startTime.isAtSameMomentAs(focusedDate);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return DecoratedBox(
      decoration: const BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: SfCalendar(
          controller: controller,
          dataSource: _AppointmentDataSource(
            _bookingToAppointmentList(context),
          ),
          appointmentBuilder: (_, details) => AppointmentCard(
            details: details,
            isFocused: _isFocusedAppointment(details),
          ),
          blackoutDates: blackoutDates,
          // Monday
          firstDayOfWeek: 1,
          headerStyle: const CalendarHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: _onCalendarTap,
          maxDate: DateTime(now.year, now.month, now.day + 31),
          minDate: now,
          monthViewSettings: const MonthViewSettings(
            appointmentDisplayCount: 20,
            dayFormat: 'EEEE',
            monthCellStyle: MonthCellStyle(
              leadingDatesTextStyle: TextStyle(fontSize: 17),
              textStyle: TextStyle(fontSize: 17),
              trailingDatesTextStyle: TextStyle(fontSize: 17),
            ),
          ),
          scheduleViewSettings: const ScheduleViewSettings(
            appointmentItemHeight: 70,
            hideEmptyScheduleWeek: true,
          ),
          showNavigationArrow: true,
          todayTextStyle: const TextStyle(fontSize: 17),
          viewHeaderStyle: ViewHeaderStyle(
            dayTextStyle: MintTextStyles.gilroy.copyWith(
              color: MintColors.bellGrey,
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
            ),
          ),
          viewHeaderHeight: 60,
          viewNavigationMode: ViewNavigationMode.none,
        ),
      ),
    );
  }
}

class _AppointmentDataSource extends CalendarDataSource {
  _AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}
