part of 'patients_bloc.dart';

@immutable
class PatientsState {
  int get rowsLimit => 8;
}

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
    required super.bookList,
    required super.hasReachedEnd,
    required super.filter,
  });
}

class PatientsFetchBookListSuccess extends PatientsBookListLoadSuccess {
  PatientsFetchBookListSuccess({
    required super.bookList,
    required super.hasReachedEnd,
    required super.filter,
  });
}

class PatientsFetchBookListFailure extends PatientsBookListLoadSuccess {
  PatientsFetchBookListFailure({
    required super.bookList,
    required super.hasReachedEnd,
    required super.filter,
  });
}
