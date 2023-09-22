part of 'audio_player_bloc.dart';

@immutable
abstract class AudioPlayerState {}

class AudioPlayerInitial extends AudioPlayerState {}

class AudioPlayerFailure extends AudioPlayerState {
  AudioPlayerFailure(this.failure);

  final PlayerFailure failure;
}

class AudioPlayerInProgress extends AudioPlayerState {
  AudioPlayerInProgress(this.playerId, this.position, this.state);

  final String playerId;
  final Duration position;
  final PlayerState state;
}

class AudioPlayerStopSuccess extends AudioPlayerState {}
