import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class UserController {
  final _userController = BehaviorSubject<UserModel?>();

  Stream<UserModel?> get user => _userController.stream;

  void addToUserStream(UserModel? user) => _userController.add(user);
}
