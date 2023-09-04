part of 'specialist_info_bloc.dart';

@immutable
abstract class SpecialistInfoEvent {}

class SpecialistInfoInitializeRequested extends SpecialistInfoEvent {}

class SpecialistInfoFetchRequested extends SpecialistInfoEvent {}
