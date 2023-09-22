import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/repository/abstract/audio_playback_repository.dart';
import 'abstract/audio_playback_service.dart';

@Injectable(as: AudioPlaybackService)
class AudioPlaybackServiceImpl implements AudioPlaybackService {
  AudioPlaybackServiceImpl(this._audioPlaybackRepository);

  final AudioPlaybackRepository _audioPlaybackRepository;

  @override
  Stream<Duration> get position => _audioPlaybackRepository.position;

  @override
  Stream<PlayerState> get playerState => _audioPlaybackRepository.playerState;

  @override
  Future<void> startPlayer(String url) {
    return _audioPlaybackRepository.startPlayer(url);
  }

  @override
  Future<void> seek(Duration duration) {
    return _audioPlaybackRepository.seek(duration);
  }

  @override
  Future<void> pausePlayer() {
    return _audioPlaybackRepository.pausePlayer();
  }

  @override
  Future<void> resumePlayer() {
    return _audioPlaybackRepository.resumePlayer();
  }

  @override
  Future<void> stopPlayer() {
    return _audioPlaybackRepository.stopPlayer();
  }

  @override
  Future<void> disposePlayer() {
    return _audioPlaybackRepository.disposePlayer();
  }
}
