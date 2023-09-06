import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../backbone/consultation_status.dart';
import '../../../domain/controller/user_controller.dart';
import '../../../domain/entity/patient_book/patient_book.dart';
import '../../../domain/entity/patient_filter.dart';
import '../../../domain/entity/user_model/user_model.dart';
import '../../../domain/usecase/fetch_patient_book_list_use_case.dart';
import '../../../utils/date_time_utils.dart';

part 'patients_event.dart';

part 'patients_state.dart';

@injectable
class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  PatientsBloc(
    this._fetchPatientBookListUseCase,
    this._userController,
  ) : super(PatientsBookListLoadSuccess()) {
    _subscribeToUserChange();
    on<PatientsFetchBookListRequested>(_onFetchBookList);
    on<PatientsRefreshRequested>(_onRefresh);
    on<PatientsSortRequested<dynamic>>(_onSort);
    on<PatientsFilterChanged>(_onFilter);
  }

  final FetchPatientBookListUseCase _fetchPatientBookListUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  late final StreamSubscription<UserModel?> _userSubscription;

  /// Pagination query cursor
  // String? _lastPatientBookId;

  /// Number of patient books to fetch
  static const _paginationLimit = 8;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onFetchBookList(
    PatientsFetchBookListRequested event,
    Emitter<PatientsState> emit,
  ) async {
    final user = _currentUser;
    final state = this.state;
    if (user == null || state is! PatientsBookListLoadSuccess) return;
    try {
      emit(
        PatientsFetchBookListLoading(
          bookList: state.bookList,
          hasReachedEnd: state.hasReachedEnd,
          filter: state.filter,
        ),
      );
      var bookList = await _fetchPatientBookListUseCase(
        user.id,
        // lastBookingId: _lastPatientBookId,
        // limit: _paginationLimit,
      );
      if (bookList.isNotEmpty) {
        bookList = bookList
          ..sort(
            (a, b) => b.bookTime.compareTo(a.bookTime),
          );
      }
      emit(
        PatientsFetchBookListSuccess(
          bookList: [
            ...state.bookList,
            ...bookList,
          ],
          hasReachedEnd: bookList.length < _paginationLimit,
          filter: state.filter,
        ),
      );
      // if (bookList.isNotEmpty) {
      //   _lastPatientBookId = bookList.last.id;
      // }
    } catch (error) {
      debugPrint('PatientsFetchBookListFailure: $error');
      emit(
        PatientsFetchBookListFailure(
          bookList: state.bookList,
          hasReachedEnd: state.hasReachedEnd,
          filter: state.filter,
        ),
      );
    }
  }

  void _onRefresh(
    PatientsRefreshRequested event,
    Emitter<PatientsState> emit,
  ) {
    emit(PatientsBookListLoadSuccess());
    add(PatientsFetchBookListRequested());
  }

  void _onSort(
    PatientsSortRequested<dynamic> event,
    Emitter<PatientsState> emit,
  ) {
    final state = this.state;
    if (state is! PatientsBookListLoadSuccess) return;

    final getField = event.getField;

    final sortedBookList = state.bookList
      ..sort(
        (a, b) {
          final aValue = getField(a);
          final bValue = getField(b);
          return event.ascending
              ? Comparable.compare(aValue, bValue)
              : Comparable.compare(bValue, aValue);
        },
      );

    emit(
      PatientsBookListLoadSuccess(
        bookList: sortedBookList,
        hasReachedEnd: state.hasReachedEnd,
      ),
    );
  }

  void _onFilter(PatientsFilterChanged event, Emitter<PatientsState> emit) {
    final state = this.state;
    final filter = event.filter;
    if (state is! PatientsBookListLoadSuccess) return;

    if (filter.isEmpty) {
      emit(
        PatientsBookListLoadSuccess(
          bookList: state.bookList,
          hasReachedEnd: state.hasReachedEnd,
          filter: filter,
        ),
      );
      return;
    }

    final filteredBookList = _filterBookList(state.bookList, filter);

    emit(
      PatientsBookListLoadSuccess(
        bookList: state.bookList,
        filteredBookList: filteredBookList,
        hasReachedEnd: state.hasReachedEnd,
        filter: filter,
      ),
    );
  }

  List<PatientBook> _filterBookList(
    List<PatientBook> bookList,
    PatientFilter filter,
  ) {
    var filteredBookList = bookList;

    if (!filter.isEmpty) {
      filteredBookList =
          _filterBySearchText(filteredBookList, filter.searchText);
    }

    final bookDate = filter.bookDate;
    if (bookDate != null) {
      filteredBookList = _filterByBookDate(filteredBookList, bookDate);
    }

    final status = filter.status;
    if (status != null) {
      filteredBookList = _filterByStatus(filteredBookList, status);
    }

    return filteredBookList.toList();
  }

  List<PatientBook> _filterBySearchText(
    List<PatientBook> bookList,
    String searchText,
  ) {
    final search = searchText.toLowerCase();
    return bookList
        .where(
          (e) =>
              (e.firstName?.toLowerCase().contains(search) ?? false) ||
              (e.lastName?.toLowerCase().contains(search) ?? false) ||
              (e.phoneNumber?.contains(search) ?? false),
        )
        .toList();
  }

  List<PatientBook> _filterByBookDate(
    List<PatientBook> bookList,
    DateTime bookDate,
  ) {
    return bookList
        .where((e) => DateTimeUtils.isSameDay(e.bookTime, bookDate))
        .toList();
  }

  List<PatientBook> _filterByStatus(
    List<PatientBook> bookList,
    ConsultationStatus status,
  ) {
    final now = DateTime.now();

    switch (status) {
      case ConsultationStatus.upcoming:
        return bookList.where((e) => e.bookTime.isAfter(now)).toList();
      case ConsultationStatus.completed:
        return bookList.where((e) => e.endTime.isBefore(now)).toList();
      case ConsultationStatus.current:
        return bookList
            .where((e) => e.bookTime.isBefore(now) && e.endTime.isAfter(now))
            .toList();
    }
  }
}