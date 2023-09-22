import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:injectable/injectable.dart';

import '../../data/repository/abstract/audio_record_repository.dart';
import 'abstract/audio_record_service.dart';

@Injectable(as: AudioRecordService)
class AudioRecordServiceImpl implements AudioRecordService {
  AudioRecordServiceImpl(this._audioRecordRepository);

  final AudioRecordRepository _audioRecordRepository;

  @override
  Stream<RecordingDisposition>? get onProgress =>
      _audioRecordRepository.onProgress;

  @override
  Future<void> initializeRecorder() async {
    await _audioRecordRepository.initializeRecorder();
  }

  @override
  Future<void> disposeRecorder() async {
    return _audioRecordRepository.disposeRecorder();
  }

  @override
  Future<void> startRecorder() {
    return _audioRecordRepository.startRecorder();
  }

  @override
  Future<String?> stopRecorder() {
    return _audioRecordRepository.stopRecorder();
  }
}
