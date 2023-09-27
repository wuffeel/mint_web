part of 'appointments_bloc.dart';

@immutable
class AppointmentsState {
  const AppointmentsState({
    this.bookingList = const [],
    this.blackoutDates = const [],
    this.isAppointmentsLoading = false,
    this.isBlackoutDatesLoading = false,
    this.isBlackoutDatesFetchTriggered = false,
    this.isAppointmentsFailure = false,
    this.isBlackoutDatesFailure = false,
  });

  final List<PatientBook> bookingList;
  final List<DateTime> blackoutDates;

  final bool isAppointmentsLoading;

  /// Flag for blackout dates loading state.
  final bool isBlackoutDatesLoading;

  /// Flag to check if blackout dates fetch event triggered.
  final bool isBlackoutDatesFetchTriggered;

  final bool isAppointmentsFailure;
  final bool isBlackoutDatesFailure;

  AppointmentsState copyWith({
    List<PatientBook>? bookingList,
    List<DateTime>? blackoutDates,
    bool? isAppointmentsLoading,
    bool? isBlackoutDatesLoading,
    bool? isBlackoutDatesFetchTriggered,
    bool? isAppointmentsFailure,
    bool? isBlackoutDatesFailure,
  }) {
    return AppointmentsState(
      bookingList: bookingList ?? this.bookingList,
      blackoutDates: blackoutDates ?? this.blackoutDates,
      isAppointmentsLoading:
          isAppointmentsLoading ?? this.isAppointmentsLoading,
      isBlackoutDatesLoading:
          isBlackoutDatesLoading ?? this.isBlackoutDatesLoading,
      isBlackoutDatesFetchTriggered:
          isBlackoutDatesFetchTriggered ?? this.isBlackoutDatesFetchTriggered,
      isAppointmentsFailure:
          isAppointmentsFailure ?? this.isAppointmentsFailure,
      isBlackoutDatesFailure:
          isBlackoutDatesFailure ?? this.isBlackoutDatesFailure,
    );
  }
}
