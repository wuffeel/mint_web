part of 'specialist_bloc.dart';

@immutable
abstract class SpecialistState {}

class SpecialistInitial extends SpecialistState {}

class SpecialistAddNewLoading extends SpecialistState {}

class SpecialistAddNewFailure extends SpecialistState {}
