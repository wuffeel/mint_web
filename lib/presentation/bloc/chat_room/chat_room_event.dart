part of 'chat_room_bloc.dart';

@immutable
abstract class ChatRoomEvent {}

class ChatRoomListFetchRequested extends ChatRoomEvent {}

class ChatRoomFetchRequested extends ChatRoomEvent {
  ChatRoomFetchRequested(this.roomId);

  final String roomId;
}
