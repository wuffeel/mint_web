import 'package:injectable/injectable.dart';

import '../service/abstract/specialist_service.dart';

@injectable
class AddWorkInfoDataUseCase {
  AddWorkInfoDataUseCase(this._service);

  final SpecialistService _service;

  Future<void> call(
    String specialistId,
    Map<String, Map<String, String>> workInfoMap,
  ) =>
      _service.addWorkInfoData(specialistId, workInfoMap);
}
