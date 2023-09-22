import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

import 'abstract/audio_playback_repository.dart';

@LazySingleton(as: AudioPlaybackRepository)
class AudioPlaybackRepositoryImpl implements AudioPlaybackRepository {
  final _player = AudioPlayer();

  @override
  Stream<Duration> get position => _player.positionStream;

  @override
  Stream<PlayerState> get playerState => _player.playerStateStream;

  @override
  Future<void> startPlayer(String url) async {
    if (_player.playerState.processingState != ProcessingState.completed) {
      await _player.stop();
    }
    await _player.setUrl(url);
    unawaited(_player.play());
  }

  @override
  Future<void> seek(Duration duration) async {
    return _player.seek(duration);
  }

  @override
  Future<void> pausePlayer() {
    return _player.pause();
  }

  @override
  Future<void> resumePlayer() {
    return _player.play();
  }

  @override
  Future<void> stopPlayer() async {
    return _player.stop();
  }

  @override
  Future<void> disposePlayer() async {
    await _player.dispose();
  }
}
