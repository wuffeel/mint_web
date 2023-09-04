import 'package:injectable/injectable.dart';

import '../entity/specialist_model/specialist_model.dart';
import '../service/abstract/specialist_service.dart';

@injectable
class FetchSpecialistDataUseCase {
  FetchSpecialistDataUseCase(this._service);

  final SpecialistService _service;

  Future<SpecialistModel?> call(String specialistId) =>
      _service.fetchSpecialistData(specialistId);
}
