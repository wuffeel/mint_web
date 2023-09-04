part of 'specialist_info_bloc.dart';

@immutable
abstract class SpecialistInfoState {}

class SpecialistInfoInitial extends SpecialistInfoState {}

class SpecialistInfoLoading extends SpecialistInfoState {}

class SpecialistInfoNotFound extends SpecialistInfoState {}

class SpecialistInfoFetchSuccess extends SpecialistInfoState {
  SpecialistInfoFetchSuccess(this.specialist);

  final SpecialistModel specialist;
}

class SpecialistInfoFetchFailure extends SpecialistInfoState {}
