part of 'onboarding_bloc.dart';

@immutable
class OnboardingState {
  const OnboardingState({
    required this.model,
    this.specializations = const [],
    this.isLoading = false,
    this.isSpecializationsError = false,
  });

  final Onboarding model;
  final List<String> specializations;
  final bool isLoading;
  final bool isSpecializationsError;

  OnboardingState copyWith({
    Onboarding? model,
    List<String>? specializations,
    bool? isLoading,
    bool? isSpecializationsError,
  }) {
    return OnboardingState(
      model: model ?? this.model,
      specializations: specializations ?? this.specializations,
      isLoading: isLoading ?? this.isLoading,
      isSpecializationsError:
          isSpecializationsError ?? this.isSpecializationsError,
    );
  }
}
