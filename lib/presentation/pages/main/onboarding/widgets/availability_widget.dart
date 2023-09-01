import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../../../backbone/work_day_validation_messages.dart';
import '../../../../../domain/entity/onboarding/onboarding.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../../utils/date_time_utils.dart';
import '../../../../widgets/form_field_container.dart';
import 'availability_weekday_list.dart';
import 'onboarding_page_container.dart';

class AvailabilityWidget extends StatelessWidget {
  const AvailabilityWidget(
    this.availability, {
    required this.onBack,
    required this.onNext,
    required this.currentWorkDayForm,
    required this.currentIndex,
    required this.onWorkDayIndexChange,
    super.key,
  });

  final VoidCallback onBack;
  final VoidCallback? onNext;
  final FormArray<Map<String, Object?>> availability;
  final WorkDayInfoForm currentWorkDayForm;
  final int currentIndex;
  final void Function(int) onWorkDayIndexChange;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    // ['Mon', 'Tue', ..., 'Sun']
    final shortWeekdays = DateTimeUtils.getShortWeekdays(
      locale: context.l10n.localeName,
    );
    final errorText = {
      WorkDayValidationMessages.startRequired: 'Required',
      WorkDayValidationMessages.endRequired: 'Required',
      WorkDayValidationMessages.timeEqual: 'Equal',
      WorkDayValidationMessages.lowDifference: 'Low difference',
    };
    return OnboardingPageContainer(
      title: l10n.yourAvailability,
      subTitle: l10n.pleaseProvideYourGeneralAvailability,
      onBack: onBack,
      onNext: onNext,
      child: ReactiveWorkDayInfoForm(
        key: ValueKey(currentIndex),
        form: currentWorkDayForm,
        child: ReactiveWorkDayInfoFormConsumer(
          builder: (context, form, child) {
            print(form.form.errors.toString());
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AvailabilityWeekdayList(
                  currentWeekday: currentIndex,
                  shortWeekdays: shortWeekdays,
                  onWeekdaySelect: onWorkDayIndexChange,
                ),
                const SizedBox(height: 28),
                ReactiveTimePicker(
                  formControl: form.startTimeControl,
                  builder: (context, picker, child) {
                    return _AvailabilityTimePicker(
                      time: picker.value,
                      hintText: l10n.startTime,
                      onTap: picker.showPicker,
                    );
                  },
                ),
                const SizedBox(height: 16),
                ReactiveTimePicker(
                  formControl: form.endTimeControl,
                  builder: (context, picker, child) {
                    return _AvailabilityTimePicker(
                      time: picker.value,
                      hintText: l10n.endTime,
                      onTap: picker.showPicker,
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AvailabilityTimePicker extends StatelessWidget {
  const _AvailabilityTimePicker({
    required this.time,
    required this.hintText,
    required this.onTap,
  });

  final TimeOfDay? time;
  final String hintText;
  final VoidCallback onTap;

  String _timeToString(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  @override
  Widget build(BuildContext context) {
    final locTime = time;
    return InkWell(
      onTap: onTap,
      child: FormFieldContainer(
        child: SizedBox(
          width: double.infinity,
          child: Text(
            locTime != null ? _timeToString(locTime) : hintText,
            style: MintTextStyles.body.copyWith(
              color: time == null
                  ? Theme.of(context).hintColor.withOpacity(0.3)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
