part of 'unread_messages_bloc.dart';

@immutable
abstract class UnreadMessagesEvent {}

class UnreadMessagesFetchRequested extends UnreadMessagesEvent {
  UnreadMessagesFetchRequested(this.roomId, this.otherUserId);

  final String roomId;
  final String otherUserId;
}

class UnreadMessagesResetRequested extends UnreadMessagesEvent {}
