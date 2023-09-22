import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

import '../service/abstract/audio_playback_service.dart';

@injectable
class GetPlayerStateStreamUseCase {
  GetPlayerStateStreamUseCase(this._service);

  final AudioPlaybackService _service;

  Stream<PlayerState> call() => _service.playerState;
}
