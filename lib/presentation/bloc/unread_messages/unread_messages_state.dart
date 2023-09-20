part of 'unread_messages_bloc.dart';

@immutable
abstract class UnreadMessagesState {}

class UnreadMessagesInitial extends UnreadMessagesState {}

class UnreadMessagesFetchSuccess extends UnreadMessagesState {
  UnreadMessagesFetchSuccess(this.unreadMap);

  final Map<String, int> unreadMap;
}

class UnreadMessagesFetchFailure extends UnreadMessagesState {}
