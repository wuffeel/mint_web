part of 'patients_bloc.dart';

@immutable
abstract class PatientsEvent {}

class PatientsFetchBookListRequested extends PatientsEvent {}

class PatientsRefreshRequested extends PatientsEvent {}

class PatientsSortRequested<T> extends PatientsEvent {
  PatientsSortRequested({this.getField, this.ascending = true});

  /// If null, sort option returns to default.
  final Comparable<T> Function(PatientBook d)? getField;
  final bool ascending;
}

class PatientsFilterChanged extends PatientsEvent {
  PatientsFilterChanged(this.filter);

  final PatientFilter filter;
}
