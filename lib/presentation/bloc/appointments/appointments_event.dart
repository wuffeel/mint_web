part of 'appointments_bloc.dart';

@immutable
abstract class AppointmentsEvent {}

class AppointmentsInitializeSubscriptionRequested extends AppointmentsEvent {}

class AppointmentsFetchBlackoutDatesRequested extends AppointmentsEvent {}

class AppointmentsFetchBookListRequested extends AppointmentsEvent {}

class AppointmentsTryAgainRequested extends AppointmentsEvent {}
