import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_module.dart';

part 'unread_messages_event.dart';

part 'unread_messages_state.dart';

@injectable
class UnreadMessagesBloc
    extends Bloc<UnreadMessagesEvent, UnreadMessagesState> {
  UnreadMessagesBloc(
    this._fetchUnreadMessagesCountUseCase,
  ) : super(UnreadMessagesInitial()) {
    on<UnreadMessagesFetchRequested>(_onFetchUnreadMessages);
    on<UnreadMessagesResetRequested>((event, emit) => UnreadMessagesInitial());
  }

  final FetchUnreadMessagesCountUseCase _fetchUnreadMessagesCountUseCase;

  Future<void> _onFetchUnreadMessages(
    UnreadMessagesFetchRequested event,
    Emitter<UnreadMessagesState> emit,
  ) async {
    try {
      final unreadCount = await _fetchUnreadMessagesCountUseCase(
        event.roomId,
        event.otherUserId,
      );
      emit(UnreadMessagesFetchSuccess(unreadCount));
    } catch (error) {
      debugPrint('UnreadMessagesFetchFailure: $error');
    }
  }
}
