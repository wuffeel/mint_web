import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/onboarding/onboarding.dart';
import '../../../utils/date_time_utils.dart';

part 'onboarding_event.dart';

part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc()
      : super(
          OnboardingState(
            model: Onboarding(availability: _getAvailabilitySkeleton()),
          ),
        ) {
    on<OnboardingLogEvent>((event, emit) {
      print('basicInfo: ${event.form.basicInfoControl?.value}');
      print('specializations: ${event.form.specializationsControl.value}');
      print('availability: ${event.form.availabilityControl.value}');
      print('experienceInfo: ${event.form.experienceInfoControl?.value}');
      print('pricing: ${event.form.pricingControl.value}');
    });
  }

  static List<WorkDayInfo> _getAvailabilitySkeleton() {
    final weekdays = DateTimeUtils.getWeekdays();
    return weekdays.map((e) => WorkDayInfo(weekday: e)).toList();
  }
}
