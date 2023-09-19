import 'package:injectable/injectable.dart';

import '../service/abstract/audio_record_service.dart';

@injectable
class StopRecorderUseCase {
  StopRecorderUseCase(this._service);

  final AudioRecordService _service;

  Future<String?> call() => _service.stopRecorder();
}
