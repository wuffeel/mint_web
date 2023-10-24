import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';

import '../service/abstract/specialist_service.dart';

@injectable
class UpdateSpecialistProfileDataUseCase {
  UpdateSpecialistProfileDataUseCase(this._service);

  final SpecialistService _service;

  Future<String?> call(
    SpecialistModel specialist,
    UserModel user, {
    FileData? photoData,
  }) =>
      _service.updateSpecialistData(specialist, user, photoData: photoData);
}
