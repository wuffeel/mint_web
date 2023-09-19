import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:injectable/injectable.dart';

import '../service/abstract/audio_record_service.dart';

@injectable
class GetRecordDurationStreamUseCase {
  GetRecordDurationStreamUseCase(this._service);

  final AudioRecordService _service;

  Stream<RecordingDisposition>? call() => _service.onProgress;
}
