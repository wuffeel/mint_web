import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
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
      final futures = event.roomList.map((room) async {
        final otherUserId = room.users
            .firstWhere((element) => element.id != event.currentUserId)
            .id;

        final unreadCount =
            await _fetchUnreadMessagesCountUseCase(room.id, otherUserId);

        return MapEntry(otherUserId, unreadCount);
      });

      final results = await Future.wait(futures);
      final unreadMap = Map<String, int>.fromEntries(results);
      emit(UnreadMessagesFetchSuccess(unreadMap));
    } catch (error) {
      debugPrint('UnreadMessagesFetchFailure: $error');
    }
  }
}
