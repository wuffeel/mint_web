import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';

import '../service/abstract/specialist_service.dart';

@injectable
class AddSpecialistWithIdUseCase {
  AddSpecialistWithIdUseCase(this._service);

  final SpecialistService _service;

  Future<void> call(String id, SpecialistModel specialist) =>
      _service.addSpecialistWithId(id, specialist);
}
