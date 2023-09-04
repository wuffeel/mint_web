part of 'onboarding_bloc.dart';

@immutable
abstract class OnboardingEvent {}

class OnboardingLogEvent extends OnboardingEvent {
  OnboardingLogEvent(this.form);

  final OnboardingForm form;
}

class OnboardingSpecializationsRequested extends OnboardingEvent {}
