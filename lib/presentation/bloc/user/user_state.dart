part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserFetchLoading extends UserState {}

class UserFetchFailure extends UserState {}

class UserUnauthenticated extends UserState {}

class UserAuthenticated extends UserState {
  UserAuthenticated(this.user);

  final UserModel user;
}

class UserLogOutFailure extends UserAuthenticated {
  UserLogOutFailure(super.user);
}

class UserLogOutSuccess extends UserState {}
