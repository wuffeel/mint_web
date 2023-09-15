part of 'chat_room_bloc.dart';

@immutable
abstract class ChatRoomState {}

class ChatRoomInitial extends ChatRoomState {}

class ChatRoomListLoading extends ChatRoomState {}

class ChatRoomListFetchFailure extends ChatRoomState {}

class ChatRoomListFetchSuccess extends ChatRoomState {
  ChatRoomListFetchSuccess(this.roomList, this.senderId);

  final List<Room> roomList;
  final String senderId;
}
