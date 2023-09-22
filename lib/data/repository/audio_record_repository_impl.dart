import 'dart:async';

import 'package:flutter_sound/flutter_sound.dart';
import 'package:injectable/injectable.dart';

import 'abstract/audio_record_repository.dart';

@LazySingleton(as: AudioRecordRepository)
class AudioRecordRepositoryImpl implements AudioRecordRepository {
  final _recorder = FlutterSoundRecorder();

  /// Suitable bit rate for good audio quality and compact output files.
  static const int _bitRate = 32000;

  @override
  Stream<RecordingDisposition>? get onProgress => _recorder.onProgress;

  @override
  Future<void> initializeRecorder() async {
    await _recorder.openRecorder();
    return _recorder.setSubscriptionDuration(const Duration(milliseconds: 10));
  }

  @override
  Future<void> disposeRecorder() async {
    return _recorder.closeRecorder();
  }

  @override
  Future<void> startRecorder() {
    return _recorder.startRecorder(
      codec: Codec.opusWebM,
      bitRate: _bitRate,
      toFile: 'audio.webm',
    );
  }

  @override
  Future<String?> stopRecorder() async {
    return _recorder.stopRecorder();
  }
}
