import 'package:flutter_sound/public/flutter_sound_recorder.dart';

abstract class AudioRecordService {
  Stream<RecordingDisposition>? get onProgress;

  Future<void> initializeRecorder();

  Future<void> disposeRecorder();

  Future<void> startRecorder();

  Future<String?> stopRecorder();
}
