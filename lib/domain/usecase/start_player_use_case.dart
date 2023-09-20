import 'package:injectable/injectable.dart';

import '../service/abstract/audio_playback_service.dart';

@injectable
class StartPlayerUseCase {
  StartPlayerUseCase(this._service);

  final AudioPlaybackService _service;

  Future<void> call(String url) => _service.startPlayer(url);
}
