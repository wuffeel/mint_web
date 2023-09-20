import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

import '../../../domain/usecase/dispose_player_use_case.dart';
import '../../../domain/usecase/get_player_position_stream_use_case.dart';
import '../../../domain/usecase/get_player_state_stream_use_case.dart';
import '../../../domain/usecase/pause_player_use_case.dart';
import '../../../domain/usecase/resume_player_use_case.dart';
import '../../../domain/usecase/seek_player_use_case.dart';
import '../../../domain/usecase/start_player_use_case.dart';
import '../../../domain/usecase/stop_player_use_case.dart';

part 'audio_player_event.dart';

part 'audio_player_state.dart';

typedef PositionData = ({Duration position, Duration bufferedPosition});

@injectable
class AudioPlayerBloc extends Bloc<AudioPlayerEvent, AudioPlayerState> {
  AudioPlayerBloc(
    this._startPlayerUseCase,
    this._resumePlayerUseCase,
    this._getPlayerPositionStreamUseCase,
    this._getPlayerStateStreamUseCase,
    this._seekPlayerUseCase,
    this._pausePlayerUseCase,
    this._stopPlayerUseCase,
    this._disposePlayerUseCase,
  ) : super(AudioPlayerInitial()) {
    _subscribeToPlayerChanges();
    on<AudioPlayerHandleActionRequested>(_onHandleAction);
    on<AudioPlayerStartRequested>(_onStartPlayer);
    on<AudioPlayerResumeRequested>(_onResumePlayer);
    on<AudioPlayerProgressRequested>(
      _onSubscribeForDuration,
      transformer: restartable(),
    );
    on<AudioPlayerSeekRequested>(_onSeekPlayer);
    on<AudioPlayerPauseRequested>(_onPausePlayer, transformer: droppable());
    on<AudioPlayerStopRequested>(_onStopPlayer);
  }

  final StartPlayerUseCase _startPlayerUseCase;
  final ResumePlayerUseCase _resumePlayerUseCase;
  final GetPlayerPositionStreamUseCase _getPlayerPositionStreamUseCase;
  final GetPlayerStateStreamUseCase _getPlayerStateStreamUseCase;
  final SeekPlayerUseCase _seekPlayerUseCase;
  final PausePlayerUseCase _pausePlayerUseCase;
  final StopPlayerUseCase _stopPlayerUseCase;
  final DisposePlayerUseCase _disposePlayerUseCase;

  late final StreamSubscription<PlayerState> _playerSubscription;

  void _subscribeToPlayerChanges() {
    _playerSubscription = _getPlayerStateStreamUseCase().listen((state) {
      if (state.processingState == ProcessingState.completed) {
        add(AudioPlayerStopRequested());
      }
    });
  }

  @override
  Future<void> close() async {
    await _disposePlayerUseCase();
    await _playerSubscription.cancel();
    return super.close();
  }

  void _onHandleAction(
    AudioPlayerHandleActionRequested event,
    Emitter<AudioPlayerState> emit,
  ) {
    final state = this.state;
    final launchOtherPlayer =
        state is AudioPlayerInProgress && state.playerId != event.playerId;

    if (launchOtherPlayer) {
      add(AudioPlayerStartRequested(event.playerId, event.url));
    } else if (state is AudioPlayerPaused) {
      add(AudioPlayerResumeRequested(event.playerId));
    } else if (state is AudioPlayerInProgress) {
      add(AudioPlayerPauseRequested());
    } else {
      add(AudioPlayerStartRequested(event.playerId, event.url));
    }
  }

  Future<void> _onStartPlayer(
    AudioPlayerStartRequested event,
    Emitter<AudioPlayerState> emit,
  ) async {
    try {
      await _startPlayerUseCase(event.url);
      add(AudioPlayerProgressRequested(event.playerId));
    } catch (error) {
      debugPrint('AudioPlayerStartFailure: $error');
      emit(AudioPlayerFailure(PlayerFailure.start));
    }
  }

  Future<void> _onResumePlayer(
    AudioPlayerResumeRequested event,
    Emitter<AudioPlayerState> emit,
  ) async {
    try {
      await _resumePlayerUseCase();
    } catch (error) {
      debugPrint('AudioPlayerResumeFailure: $error');
      emit(AudioPlayerFailure(PlayerFailure.start));
    }
  }

  Future<void> _onSubscribeForDuration(
    AudioPlayerProgressRequested event,
    Emitter<AudioPlayerState> emit,
  ) async {
    return emit.forEach(
      _getPlayerPositionStreamUseCase(),
      onData: (progress) {
        return AudioPlayerInProgress(event.playerId, progress);
      },
      onError: (error, _) {
        debugPrint('AudioPlayerProgressFailure: $error');
        return AudioPlayerFailure(PlayerFailure.progress);
      },
    );
  }

  Future<void> _onSeekPlayer(
    AudioPlayerSeekRequested event,
    Emitter<AudioPlayerState> emit,
  ) async {
    try {
      await _seekPlayerUseCase(event.duration);
    } catch (error) {
      debugPrint('AudioPlayerSeekFailure: $error');
      emit(AudioPlayerFailure(PlayerFailure.seek));
    }
  }

  Future<void> _onPausePlayer(
    AudioPlayerPauseRequested event,
    Emitter<AudioPlayerState> emit,
  ) async {
    final state = this.state;
    if (state is! AudioPlayerInProgress) return;
    try {
      await _pausePlayerUseCase();
      emit(AudioPlayerPaused(state.playerId, state.position));
    } catch (error) {
      debugPrint('AudioPlayerStopFailure: $error');
      emit(AudioPlayerFailure(PlayerFailure.pause));
    }
  }

  Future<void> _onStopPlayer(
    AudioPlayerStopRequested event,
    Emitter<AudioPlayerState> emit,
  ) async {
    try {
      await _stopPlayerUseCase();
      emit(AudioPlayerStopSuccess());
    } catch (error) {
      debugPrint('AudioPlayerStopFailure: $error');
      emit(AudioPlayerFailure(PlayerFailure.pause));
    }
  }
}
