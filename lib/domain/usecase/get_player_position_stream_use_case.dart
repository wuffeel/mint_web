import 'package:injectable/injectable.dart';

import '../service/abstract/audio_playback_service.dart';

@injectable
class GetPlayerPositionStreamUseCase {
  GetPlayerPositionStreamUseCase(this._service);

  final AudioPlaybackService _service;

  Stream<Duration> call() => _service.position;
}
