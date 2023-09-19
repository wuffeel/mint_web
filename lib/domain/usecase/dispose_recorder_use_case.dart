import 'package:injectable/injectable.dart';

import '../service/abstract/audio_record_service.dart';

@injectable
class DisposeRecorderUseCase {
  DisposeRecorderUseCase(this._service);

  final AudioRecordService _service;

  Future<void> call() => _service.disposeRecorder();
}
