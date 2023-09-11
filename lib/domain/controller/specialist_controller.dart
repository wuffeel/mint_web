import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class SpecialistController {
  final _specialistController = BehaviorSubject<SpecialistModel>();

  Stream<SpecialistModel> get specialist => _specialistController.stream;

  void addToSpecialistStream(SpecialistModel specialist) =>
      _specialistController.add(specialist);
}
