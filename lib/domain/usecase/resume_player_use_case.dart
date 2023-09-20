import 'package:injectable/injectable.dart';

import '../service/abstract/audio_playback_service.dart';

@injectable
class ResumePlayerUseCase {
  ResumePlayerUseCase(this._service);

  final AudioPlaybackService _service;

  Future<void> call() => _service.resumePlayer();
}
