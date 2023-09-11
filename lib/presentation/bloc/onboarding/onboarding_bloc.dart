import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../domain/entity/onboarding/onboarding.dart';
import '../../../domain/usecase/fetch_specializations_use_case.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

@injectable
class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc(this._fetchSpecializationsUseCase)
      : super(
          OnboardingState(
            model: Onboarding(
              basicInfo: BasicInfo(),
              experienceInfo: ExperienceInfo(),
              availability: _getAvailabilitySkeleton(),
            ),
          ),
        ) {
    on<OnboardingSpecializationsRequested>(_onSpecializationsRequested);
  }

  final FetchSpecializationsUseCase _fetchSpecializationsUseCase;

  static List<WorkDayInfo> _getAvailabilitySkeleton() {
    final weekdays = DateTimeUtils.getWeekdays();
    return weekdays.map((e) => WorkDayInfo(weekday: e)).toList();
  }

  Future<void> _onSpecializationsRequested(
    OnboardingSpecializationsRequested event,
    Emitter<OnboardingState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      final specializations = await _fetchSpecializationsUseCase();
      emit(state.copyWith(specializations: specializations, isLoading: false));
    } catch (error) {
      debugPrint('OnboardingSpecialistFetchError: $error');
      emit(state.copyWith(isSpecializationsError: true, isLoading: false));
    }
  }
}
