part of 'audio_player_bloc.dart';

enum PlayerFailure { initialize, start, progress, seek, pause }

@immutable
abstract class AudioPlayerState {}

class AudioPlayerInitial extends AudioPlayerState {}

class AudioPlayerFailure extends AudioPlayerState {
  AudioPlayerFailure(this.failure);

  final PlayerFailure failure;
}

class AudioPlayerInProgress extends AudioPlayerState {
  AudioPlayerInProgress(this.playerId, this.position);

  final String playerId;
  final Duration position;
}

class AudioPlayerPaused extends AudioPlayerInProgress {
  AudioPlayerPaused(super.playerId, super.position);
}

class AudioPlayerStopSuccess extends AudioPlayerState {}
