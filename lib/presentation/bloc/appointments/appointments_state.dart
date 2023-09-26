part of 'appointments_bloc.dart';

@immutable
abstract class AppointmentsState {}

class AppointmentsInitial extends AppointmentsState {}

class AppointmentsLoading extends AppointmentsState {}

class AppointmentsFetchBookListSuccess extends AppointmentsState {
  AppointmentsFetchBookListSuccess(this.bookingList, this.blackoutDates);

  final List<PatientBook> bookingList;
  final List<DateTime> blackoutDates;
}

class AppointmentsFetchBookListFailure extends AppointmentsState {}
