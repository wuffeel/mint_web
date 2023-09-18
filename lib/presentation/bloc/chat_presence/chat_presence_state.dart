part of 'chat_presence_bloc.dart';

@immutable
abstract class ChatPresenceState {}

class ChatPresenceInitial extends ChatPresenceState {}

class ChatPresenceInitializeFailure extends ChatPresenceState {}

class ChatPresenceUserSuccess extends ChatPresenceState {
  ChatPresenceUserSuccess(this.presence);

  final UserPresence presence;
}

class ChatPresenceUserFailure extends ChatPresenceState {}
