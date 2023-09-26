part of 'appointments_bloc.dart';

@immutable
abstract class AppointmentsEvent {}

class AppointmentsFetchBookListRequested extends AppointmentsEvent {}
