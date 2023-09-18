import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

part 'chat_presence_event.dart';

part 'chat_presence_state.dart';

@injectable
class ChatPresenceBloc extends Bloc<ChatPresenceEvent, ChatPresenceState> {
  ChatPresenceBloc(this._getUserPresenceUseCase)
      : super(ChatPresenceInitial()) {
    on<ChatPresenceUserRequested>(_onGetUserPresence);
  }

  final GetUserPresenceUseCase _getUserPresenceUseCase;

  Future<void> _onGetUserPresence(
    ChatPresenceUserRequested event,
    Emitter<ChatPresenceState> emit,
  ) async {
    return emit.forEach(
      await _getUserPresenceUseCase(event.userId),
      onData: ChatPresenceUserSuccess.new,
      onError: (error, _) {
        debugPrint('ChatPresenceUserFailure: $error');
        return ChatPresenceUserFailure();
      },
    );
  }
}
