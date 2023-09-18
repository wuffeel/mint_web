part of 'unread_messages_bloc.dart';

@immutable
abstract class UnreadMessagesState {}

class UnreadMessagesInitial extends UnreadMessagesState {}

class UnreadMessagesFetchSuccess extends UnreadMessagesState {
  UnreadMessagesFetchSuccess(this.unreadCount);

  final int unreadCount;
}

class UnreadMessagesFetchFailure extends UnreadMessagesState {}
