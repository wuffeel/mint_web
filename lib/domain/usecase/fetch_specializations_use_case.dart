import 'package:injectable/injectable.dart';

import '../service/abstract/specialist_service.dart';

@injectable
class FetchSpecializationsUseCase {
  FetchSpecializationsUseCase(this._service);

  final SpecialistService _service;

  Future<List<String>> call() => _service.fetchAvailableSpecializations();
}
