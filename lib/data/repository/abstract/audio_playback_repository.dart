import 'package:just_audio/just_audio.dart';

abstract class AudioPlaybackRepository {
  Stream<Duration> get position;

  Stream<PlayerState> get playerState;

  Future<void> startPlayer(String url);

  Future<void> seek(Duration duration);

  Future<void> pausePlayer();

  Future<void> resumePlayer();

  Future<void> stopPlayer();

  Future<void> disposePlayer();
}
