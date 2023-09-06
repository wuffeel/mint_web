part of 'patients_bloc.dart';

@immutable
class PatientsState {
  int get rowsLimit => 8;
}

class PatientsBookListLoadSuccess extends PatientsState {
  PatientsBookListLoadSuccess({
    this.bookList = const [],
    this.hasReachedEnd = false,
  });

  final List<PatientBook> bookList;
  final bool hasReachedEnd;
}

class PatientsFetchBookListLoading extends PatientsBookListLoadSuccess {
  PatientsFetchBookListLoading({
    required super.bookList,
    required super.hasReachedEnd,
  });
}

class PatientsFetchBookListSuccess extends PatientsBookListLoadSuccess {
  PatientsFetchBookListSuccess({
    required super.bookList,
    required super.hasReachedEnd,
  });
}

class PatientsFetchBookListFailure extends PatientsBookListLoadSuccess {
  PatientsFetchBookListFailure({
    required super.bookList,
    required super.hasReachedEnd,
  });
}
