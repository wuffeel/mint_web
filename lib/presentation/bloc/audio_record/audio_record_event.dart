part of 'audio_record_bloc.dart';

@immutable
abstract class AudioRecordEvent {}

class AudioRecordInitializeRequested extends AudioRecordEvent {}

class AudioRecordStartRequested extends AudioRecordEvent {}

class AudioRecordSubscribeForDuration extends AudioRecordEvent {}

class AudioRecordStopRequested extends AudioRecordEvent {}
