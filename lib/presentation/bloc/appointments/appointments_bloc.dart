import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../../../domain/entity/patient_book/patient_book.dart';
import '../../../domain/usecase/fetch_patient_book_list_use_case.dart';

part 'appointments_event.dart';

part 'appointments_state.dart';

@injectable
class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc(
    this._fetchPatientBookListUseCase,
    this._userController,
    this._getExcludedDaysByIdUseCase,
  ) : super(AppointmentsInitial()) {
    _subscribeToUserChange();
    on<AppointmentsFetchBookListRequested>(_onFetchBookList);
  }

  final FetchPatientBookListUseCase _fetchPatientBookListUseCase;
  final GetExcludedDaysByIdUseCase _getExcludedDaysByIdUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  late final StreamSubscription<UserModel?> _userSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
      if (state is AppointmentsInitial) {
        add(AppointmentsFetchBookListRequested());
      }
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onFetchBookList(
    AppointmentsFetchBookListRequested event,
    Emitter<AppointmentsState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    emit(AppointmentsLoading());
    final blackoutDates = await _getExcludedDaysByIdUseCase(user.id);
    try {
      return emit.forEach(
        // TODO(wuffeel): investigate a way to connect with PatientsBloc
        await _fetchPatientBookListUseCase(user.id),
        onData: (bookList) =>
            AppointmentsFetchBookListSuccess(bookList, blackoutDates),
      );
    } catch (error) {
      debugPrint('AppointmentsFetchBookListFailure: $error');
      emit(AppointmentsFetchBookListFailure());
    }
  }
}
