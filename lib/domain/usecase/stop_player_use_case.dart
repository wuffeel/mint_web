import 'package:injectable/injectable.dart';

import '../service/abstract/audio_playback_service.dart';

@injectable
class StopPlayerUseCase {
  StopPlayerUseCase(this._service);

  final AudioPlaybackService _service;

  Future<void> call() => _service.stopPlayer();
}
