part of 'chat_presence_bloc.dart';

@immutable
abstract class ChatPresenceEvent {}

class ChatPresenceUserRequested extends ChatPresenceEvent {
  ChatPresenceUserRequested(this.userId);

  final String userId;
}
