import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/dispose_recorder_use_case.dart';
import '../../../domain/usecase/get_record_duration_stream_use_case.dart';
import '../../../domain/usecase/initialize_recorder_use_case.dart';
import '../../../domain/usecase/start_recorder_use_case.dart';
import '../../../domain/usecase/stop_recorder_use_case.dart';

part 'audio_record_event.dart';

part 'audio_record_state.dart';

@injectable
class AudioRecordBloc extends Bloc<AudioRecordEvent, AudioRecordState> {
  AudioRecordBloc(
    this._initializeRecorderUseCase,
    this._startRecorderUseCase,
    this._getRecordDurationStreamUseCase,
    this._stopRecorderUseCase,
    this._disposeRecorderUseCase,
  ) : super(AudioRecordInitial()) {
    on<AudioRecordInitializeRequested>(_onInitializeRecorder);
    on<AudioRecordStartRequested>(_onStartRecord);
    on<AudioRecordProgressChanged>(
      (event, emit) => AudioRecordInProgress(event.progress),
    );
    on<AudioRecordStopRequested>(_onStopRecord);
    on<AudioRecordSubscribeForDuration>(_onSubscribeForDuration);
  }

  final InitializeRecorderUseCase _initializeRecorderUseCase;
  final StartRecorderUseCase _startRecorderUseCase;
  final GetRecordDurationStreamUseCase _getRecordDurationStreamUseCase;
  final StopRecorderUseCase _stopRecorderUseCase;
  final DisposeRecorderUseCase _disposeRecorderUseCase;

  @override
  Future<void> close() async {
    await _disposeRecorderUseCase();
    return super.close();
  }

  Future<void> _onInitializeRecorder(
    AudioRecordInitializeRequested event,
    Emitter<AudioRecordState> emit,
  ) async {
    try {
      await _initializeRecorderUseCase();
      emit(AudioRecordInitializeSuccess());
    } catch (error) {
      debugPrint('AudioRecordInitializeFailure: $error');
      emit(AudioRecordInitializeFailure());
    }
  }

  Future<void> _onStartRecord(
    AudioRecordStartRequested event,
    Emitter<AudioRecordState> emit,
  ) async {
    try {
      await _startRecorderUseCase();
      add(AudioRecordSubscribeForDuration());
    } catch (error) {
      debugPrint('AudioRecordStartFailure: $error');
      emit(AudioRecordStartFailure());
    }
  }

  Future<void> _onStopRecord(
    AudioRecordStopRequested event,
    Emitter<AudioRecordState> emit,
  ) async {
    try {
      final audioPath = await _stopRecorderUseCase();
      if (audioPath == null) return;
      final state = this.state;
      if (state is! AudioRecordInProgress) return;
      emit(AudioRecordCompleteSuccess(audioPath, state.progress));
    } catch (error) {
      debugPrint('AudioRecordStopFailure: $error');
      emit(AudioRecordStopFailure());
    }
  }

  Future<void> _onSubscribeForDuration(
    AudioRecordSubscribeForDuration event,
    Emitter<AudioRecordState> emit,
  ) async {
    final recordStream = _getRecordDurationStreamUseCase();
    log(recordStream.toString());
    if (recordStream == null) return;
    return emit.forEach(
      recordStream,
      onData: (record) => AudioRecordInProgress(record.duration),
      onError: (error, _) {
        debugPrint('$error');
        return AudioRecordStartFailure();
      },
    );
  }
}
