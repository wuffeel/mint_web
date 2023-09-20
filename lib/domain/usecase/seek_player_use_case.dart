import 'package:injectable/injectable.dart';

import '../service/abstract/audio_playback_service.dart';

@injectable
class SeekPlayerUseCase {
  SeekPlayerUseCase(this._service);

  final AudioPlaybackService _service;

  Future<void> call(Duration duration) => _service.seek(duration);
}
