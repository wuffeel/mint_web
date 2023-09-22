import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

import '../../../domain/usecase/fetch_chat_room_list_use_case.dart';

part 'chat_room_event.dart';

part 'chat_room_state.dart';

@injectable
class ChatRoomBloc extends Bloc<ChatRoomEvent, ChatRoomState> {
  ChatRoomBloc(
    this._fetchChatRoomListUseCase,
    this._userController,
  ) : super(ChatRoomInitial()) {
    _subscribeToUserChange();
    on<ChatRoomListFetchRequested>(_onFetchRoomList);
  }

  final FetchChatRoomListUseCase _fetchChatRoomListUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  late final StreamSubscription<UserModel?> _userSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
      if (state is ChatRoomInitial) add(ChatRoomListFetchRequested());
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onFetchRoomList(
    ChatRoomListFetchRequested event,
    Emitter<ChatRoomState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    emit(ChatRoomListLoading());
    return emit.forEach(
      await _fetchChatRoomListUseCase(user.id),
      onData: (rooms) => ChatRoomListFetchSuccess(rooms, user.id),
      onError: (error, _) {
        debugPrint('ChatRoomListFetchFailure: $error');
        return ChatRoomListFetchFailure();
      },
    );
  }
}
