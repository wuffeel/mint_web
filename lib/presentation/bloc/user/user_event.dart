part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserInitializeRequested extends UserEvent {}

class UserFetchRequested extends UserEvent {}

class UserLogOutRequested extends UserEvent {}
