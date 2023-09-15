import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

import '../../../domain/usecase/fetch_user_use_case.dart';
import '../../../domain/usecase/log_out_use_case.dart';

part 'user_event.dart';

part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(
    this._userController,
    this._fetchUserUseCase,
    this._logOutUseCase,
  ) : super(UserInitial()) {
    on<UserInitializeRequested>(_userInitializer);
    on<UserFetchRequested>(_onFetchUser);
    on<UserLogOutRequested>(_onLogOut);
  }

  final FetchUserUseCase _fetchUserUseCase;
  final LogOutUseCase _logOutUseCase;

  final UserController _userController;

  Future<void> _userInitializer(
    UserInitializeRequested event,
    Emitter<UserState> emit,
  ) async {
    return emit.forEach(
      _userController.user,
      onData: (user) =>
          user != null ? UserAuthenticated(user) : UserUnauthenticated(),
    );
  }

  Future<void> _onFetchUser(
    UserFetchRequested event,
    Emitter<UserState> emit,
  ) async {
    final state = this.state;
    if (state is UserAuthenticated) return;

    try {
      emit(UserFetchLoading());
      final user = await _fetchUserUseCase();
      _userController.addToUserStream(user);
    } catch (error) {
      debugPrint('UserFetchFailure: $error');
      emit(UserFetchFailure());
    }
  }

  Future<void> _onLogOut(
    UserLogOutRequested event,
    Emitter<UserState> emit,
  ) async {
    final state = this.state;
    if (state is! UserAuthenticated) return;

    try {
      await _logOutUseCase();
      _userController.addToUserStream(null);
    } catch (error) {
      debugPrint('UserLogOutFailure: $error');
      emit(UserLogOutFailure(state.user));
    }
  }
}
