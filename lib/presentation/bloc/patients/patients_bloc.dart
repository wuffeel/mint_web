import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/controller/user_controller.dart';
import '../../../domain/entity/patient_book/patient_book.dart';
import '../../../domain/entity/user_model/user_model.dart';
import '../../../domain/usecase/fetch_patient_book_list_use_case.dart';

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
        ),
      );
      final bookList = await _fetchPatientBookListUseCase(
        user.id,
        // lastBookingId: _lastPatientBookId,
        // limit: _paginationLimit,
      );
      emit(
        PatientsFetchBookListSuccess(
          bookList: [...state.bookList, ...bookList],
          hasReachedEnd: bookList.length < _paginationLimit,
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
        ),
      );
    }
  }
}
