part of 'audio_record_bloc.dart';

@immutable
abstract class AudioRecordState {}

class AudioRecordInitial extends AudioRecordState {}

class AudioRecordInitializeSuccess extends AudioRecordState {}

class AudioRecordInitializeFailure extends AudioRecordState {}

class AudioRecordStartFailure extends AudioRecordState {}

class AudioRecordStopFailure extends AudioRecordState {}

class AudioRecordInProgress extends AudioRecordState {
  AudioRecordInProgress(this.progress);

  final Duration progress;
}

class AudioRecordCompleteSuccess extends AudioRecordState {
  AudioRecordCompleteSuccess(this.audioPath, this.duration);

  final String audioPath;
  final Duration duration;
}
