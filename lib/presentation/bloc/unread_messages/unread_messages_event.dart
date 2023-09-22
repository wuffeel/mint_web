part of 'unread_messages_bloc.dart';

@immutable
abstract class UnreadMessagesEvent {}

class UnreadMessagesFetchRequested extends UnreadMessagesEvent {
  UnreadMessagesFetchRequested(this.roomList, this.currentUserId);

  final List<types.Room> roomList;
  final String currentUserId;
}

class UnreadMessagesResetRequested extends UnreadMessagesEvent {}
