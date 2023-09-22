part of 'audio_player_bloc.dart';

@immutable
abstract class AudioPlayerEvent {}

class AudioPlayerHandleActionRequested extends AudioPlayerEvent {
  AudioPlayerHandleActionRequested(this.playerId, this.url);

  final String playerId;
  final String url;
}

class AudioPlayerStartRequested extends AudioPlayerEvent {
  AudioPlayerStartRequested(this.playerId, this.url);

  final String playerId;
  final String url;
}

class AudioPlayerResumeRequested extends AudioPlayerEvent {
  AudioPlayerResumeRequested(this.playerId);

  final String playerId;
}

class AudioPlayerProgressRequested extends AudioPlayerEvent {
  AudioPlayerProgressRequested(this.playerId);

  final String playerId;
}

class AudioPlayerSeekRequested extends AudioPlayerEvent {
  AudioPlayerSeekRequested(this.duration);

  final Duration duration;
}

class AudioPlayerPauseRequested extends AudioPlayerEvent {}

class AudioPlayerStopRequested extends AudioPlayerEvent {}
