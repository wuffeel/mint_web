import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../backbone/work_day_validation_messages.dart' as oc;
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

  /// Name for start time field to be stored in a work info map
  static String get _startTimeField => 'startTime';

  /// Name for end time field to be stored in a work info map
  static String get _endTimeField => 'endTime';

  static List<WorkDayInfo> _getAvailabilitySkeleton() {
    final weekdays = DateTimeUtils.getWeekdays();
    return weekdays.map((e) => WorkDayInfo(weekday: e)).toList();
  }

/*  static final _form = fb.group({
    oc.basicInfoGroup: fb.group({
      oc.firstNameControl: ['', Validators.required],
      oc.lastNameControl: ['', Validators.required],
      oc.emailControl: [
        '',
        Validators.required,
        Validators.email,
      ],
      oc.dateOfBirthControl: FormControl<DateTime>(
        validators: [Validators.required],
      ),
    }),
    oc.specializations: fb.array<String>([]),
    oc.experienceGroup: fb.group({
      oc.experienceControl: FormControl<DateTime>(),
      oc.aboutControl: ['', Validators.required],
      oc.educationControl: ['', Validators.required],
    }),
    oc.pricingControl: fb.control(0),
    oc.availabilityControl: fb.control(
      {
        for (var item in DateTimeUtils.getWeekdays())
          item: {_startTimeField: null, _endTimeField: null}
      },
    ),
  });*/
}
