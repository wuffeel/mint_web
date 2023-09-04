part of 'specialist_bloc.dart';

@immutable
abstract class SpecialistEvent {}

class SpecialistAddNewRequested extends SpecialistEvent {
  SpecialistAddNewRequested(this.onboarding);

  final Onboarding onboarding;
}
