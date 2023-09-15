part of 'patients_bloc.dart';

@immutable
class PatientsState {
  int get rowsLimit => 8;
}

class PatientsInitial extends PatientsState {}

class PatientsBookListLoadSuccess extends PatientsState {
  PatientsBookListLoadSuccess({
    this.bookList = const [],
    this.filteredBookList = const [],
    this.hasReachedEnd = false,
    this.filter = PatientFilter.empty,
  });

  final List<PatientBook> bookList;
  final List<PatientBook> filteredBookList;
  final bool hasReachedEnd;
  final PatientFilter filter;

  DateTime? get minBookTime => bookList.isEmpty
      ? null
      : bookList
          .map((book) => book.bookTime)
          .reduce((a, b) => a.isBefore(b) ? a : b);

  DateTime? get maxBookTime => bookList.isEmpty
      ? null
      : bookList
          .map((book) => book.bookTime)
          .reduce((a, b) => a.isAfter(b) ? a : b);
}

class PatientsFetchBookListLoading extends PatientsBookListLoadSuccess {
  PatientsFetchBookListLoading({
    super.bookList,
    super.hasReachedEnd,
    super.filter,
  });
}

class PatientsFetchBookListSuccess extends PatientsBookListLoadSuccess {
  PatientsFetchBookListSuccess({
    required super.bookList,
    required super.hasReachedEnd,
    super.filter,
  });
}

class PatientsFetchBookListFailure extends PatientsBookListLoadSuccess {
  PatientsFetchBookListFailure({
    super.bookList,
    super.hasReachedEnd,
    super.filter,
  });
}
