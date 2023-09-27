import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../../../domain/controller/booking_controller.dart';
import '../../../domain/entity/patient_book/patient_book.dart';
import '../../../domain/usecase/fetch_patient_book_list_use_case.dart';

part 'appointments_event.dart';

part 'appointments_state.dart';

@injectable
class AppointmentsBloc extends Bloc<AppointmentsEvent, AppointmentsState> {
  AppointmentsBloc(
    this._fetchPatientBookListUseCase,
    this._userController,
    this._bookingController,
    this._getExcludedDaysByIdUseCase,
  ) : super(const AppointmentsState()) {
    _subscribeToUserChange();
    on<AppointmentsInitializeSubscriptionRequested>(_onInitializeSubscription);
    on<AppointmentsFetchBlackoutDatesRequested>(_onFetchBlackoutDates);
    on<AppointmentsFetchBookListRequested>(_onFetchBookList);
    on<AppointmentsTryAgainRequested>(_onTryAgain);
  }

  final FetchPatientBookListUseCase _fetchPatientBookListUseCase;
  final GetExcludedDaysByIdUseCase _getExcludedDaysByIdUseCase;

  final UserController _userController;
  final BookingController _bookingController;

  UserModel? _currentUser;
  late final StreamSubscription<UserModel?> _userSubscription;
  late final StreamSubscription<List<PatientBook>> _appointmentsSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;

      if (!state.isBlackoutDatesFetchTriggered) {
        add(AppointmentsFetchBlackoutDatesRequested());
      }
      if (!_bookingController.hasValue || !_bookingController.hasListener) {
        add(AppointmentsFetchBookListRequested());
      }
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _appointmentsSubscription.cancel();
    return super.close();
  }

  Future<void> _onInitializeSubscription(
    AppointmentsInitializeSubscriptionRequested event,
    Emitter<AppointmentsState> emit,
  ) async {
    return emit.forEach(
      _bookingController.bookings,
      onData: (bookList) => state.copyWith(
        bookingList: bookList,
        isAppointmentsLoading: false,
        isAppointmentsFailure: false,
      ),
      onError: (error, _) {
        debugPrint('AppointmentsFetchFailure: $error');
        return state.copyWith(
          isAppointmentsLoading: false,
          isAppointmentsFailure: true,
        );
      },
    );
  }

  Future<void> _onFetchBlackoutDates(
    AppointmentsFetchBlackoutDatesRequested event,
    Emitter<AppointmentsState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    emit(
      state.copyWith(
        isBlackoutDatesLoading: true,
        isBlackoutDatesFetchTriggered: true,
      ),
    );
    try {
      final blackoutDates = await _getExcludedDaysByIdUseCase(user.id);
      emit(
        state.copyWith(
          blackoutDates: blackoutDates,
          isBlackoutDatesLoading: false,
          isBlackoutDatesFailure: false,
        ),
      );
    } catch (error) {
      debugPrint('AppointmentsFetchBlackoutDatesFailure: $error');
      emit(
        state.copyWith(
          isBlackoutDatesLoading: false,
          isBlackoutDatesFailure: true,
        ),
      );
    }
  }

  Future<void> _onFetchBookList(
    AppointmentsFetchBookListRequested event,
    Emitter<AppointmentsState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    try {
      emit(
        state.copyWith(
          bookingList: const [],
          isAppointmentsLoading: true,
          isAppointmentsFailure: false,
        ),
      );
      final bookingsStream = await _fetchPatientBookListUseCase(user.id);
      _appointmentsSubscription =
          bookingsStream.listen(_bookingController.addToBookingStream);
    } catch (error) {
      debugPrint('AppointmentsFetchStreamFailure: $error');
      emit(
        state.copyWith(
          isAppointmentsLoading: false,
          isAppointmentsFailure: true,
        ),
      );
    }
  }

  void _onTryAgain(
    AppointmentsTryAgainRequested event,
    Emitter<AppointmentsState> emit,
  ) {
    if (state.isAppointmentsFailure) add(AppointmentsFetchBookListRequested());
    if (state.isBlackoutDatesFailure) {
      add(AppointmentsFetchBlackoutDatesRequested());
    }
  }
}
