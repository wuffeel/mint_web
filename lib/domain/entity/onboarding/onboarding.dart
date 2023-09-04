import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../backbone/work_day_validation_messages.dart';

part 'onboarding.gform.dart';

@Rf()
class Onboarding {
  Onboarding({
    required this.basicInfo,
    required this.experienceInfo,
    @RfControl(validators: [RequiredValidator()])
    this.specializations = const [],
    @RfControl(validators: [MinValidator(1)]) this.pricing = 0,
    @RfArray(validators: [WorkDayInfoListValidator()])
    this.availability = const [],
  });

  final BasicInfo basicInfo;
  final List<String> specializations;
  final ExperienceInfo experienceInfo;
  final int pricing;
  final List<WorkDayInfo> availability;
}

@Rf()
@RfGroup<dynamic>()
class BasicInfo {
  BasicInfo({
    @RfControl(validators: [RequiredValidator()]) this.firstName = '',
    @RfControl(validators: [RequiredValidator()]) this.lastName = '',
    @RfControl(
      validators: [RequiredValidator(), EmailValidator()],
    )
    this.email = '',
    @RfControl(validators: [RequiredValidator()]) this.dateOfBirth,
  });

  final String firstName;
  final String lastName;
  final String email;
  final DateTime? dateOfBirth;
}

@Rf()
@RfGroup<dynamic>(validators: [ExperienceInfoValidator()])
class ExperienceInfo {
  ExperienceInfo({
    @RfControl<DateTime>() this.experience,
    @RfControl<bool>() this.noExperience,
    @RfControl(validators: [RequiredValidator()]) this.about,
    @RfControl(validators: [RequiredValidator()]) this.education,
  });

  factory ExperienceInfo.fromMap(Map<String, dynamic> map) {
    return ExperienceInfo(
      experience: map['experience'] as DateTime?,
      noExperience: map['noExperience'] as bool?,
      about: map['about'] as String?,
      education: map['education'] as String?,
    );
  }

  final DateTime? experience;
  final bool? noExperience;
  final String? about;
  final String? education;
}

@Rf()
@RfGroup(validators: [WorkDayInfoValidator()])
class WorkDayInfo {
  WorkDayInfo({
    this.weekday = '',
    @RfControl<TimeOfDay>() this.startTime,
    @RfControl<TimeOfDay>() this.endTime,
  });

  factory WorkDayInfo.fromMap(Map<String, dynamic> map) {
    return WorkDayInfo(
      weekday: map['weekday'] as String,
      startTime: map['startTime'] as TimeOfDay?,
      endTime: map['endTime'] as TimeOfDay?,
    );
  }

  /// Weekday name in English, e.g. 'Monday'.
  final String weekday;

  /// Start time of working day in 12-hour format, e.g. 0:00 AM.
  final TimeOfDay? startTime;

  /// End time of working day in 12-hour format, e.g. 0:00 AM.
  final TimeOfDay? endTime;
}

class ExperienceInfoValidator extends Validator<dynamic> {
  const ExperienceInfoValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final experienceInfo =
        ExperienceInfo.fromMap(control.value as Map<String, Object?>);

    final noExperience = experienceInfo.noExperience;

    if (experienceInfo.experience != null ||
        (noExperience != null && noExperience)) {
      return null;
    } else {
      return {ValidationMessage.requiredTrue: true};
    }
  }
}

class WorkDayInfoValidator extends Validator<dynamic> {
  const WorkDayInfoValidator() : super();

  /// The minimum possible consultation minutes
  static const int _minConsultationMinutes = 60;

  /// Calculates the time difference in minutes between [startTime] and
  /// [endTime].
  ///
  /// The function considers the time span between [startTime] and [endTime],
  /// even if [endTime] is earlier than [startTime].
  int _minutesDifference(TimeOfDay startTime, TimeOfDay endTime) {
    final startMinutes = startTime.hour * 60 + startTime.minute;
    var endMinutes = endTime.hour * 60 + endTime.minute;

    if (endMinutes < startMinutes) {
      endMinutes += 24 * 60;
    }

    return endMinutes - startMinutes;
  }

  void _clearErrors(
    AbstractControl<dynamic> startControl,
    AbstractControl<dynamic> endControl,
  ) {
    startControl.setErrors({});
    endControl.setErrors({});
  }

  void _setErrors(
    Map<String, bool> error,
    FormGroup formControl, {
    AbstractControl<dynamic>? startControl,
    AbstractControl<dynamic>? endControl,
  }) {
    formControl.markAllAsTouched();
    if (startControl != null) startControl.setErrors(error);
    if (endControl != null) endControl.setErrors(error);
  }

  /// Handles time comparison and sets validation errors if conditions are met.
  ///
  /// Compares [startTime] and [endTime] within the [formControl] and sets
  /// validation errors for [startTimeControl] and [endTimeControl] as needed.
  ///
  /// Checks for:
  /// - [startTime] and [endTime] equality
  /// - time difference between [startTime] and [endTime] lower than
  /// [_minConsultationMinutes]
  void _handleTimeComparison(
    FormGroup formControl,
    AbstractControl<dynamic> startTimeControl,
    AbstractControl<dynamic> endTimeControl,
    TimeOfDay startTime,
    TimeOfDay endTime,
  ) {
    if (startTime.hour == endTime.hour && startTime.minute == endTime.minute) {
      _setErrors(
        {WorkDayValidationMessages.timeEqual: true},
        formControl,
        startControl: startTimeControl,
        endControl: endTimeControl,
      );
    } else if (_minutesDifference(startTime, endTime) <
        _minConsultationMinutes) {
      _setErrors(
        {WorkDayValidationMessages.lowDifference: true},
        formControl,
        startControl: startTimeControl,
        endControl: endTimeControl,
      );
    } else {
      _clearErrors(startTimeControl, endTimeControl);
    }
  }

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final errorStart = {WorkDayValidationMessages.startRequired: true};
    final errorEnd = {WorkDayValidationMessages.endRequired: true};

    control as FormGroup;
    final startTimeControl =
        control.control(WorkDayInfoForm.startTimeControlName);
    final endTimeControl = control.control(WorkDayInfoForm.endTimeControlName);
    final workInfo = WorkDayInfo.fromMap(control.value);
    final startTime = workInfo.startTime;
    final endTime = workInfo.endTime;

    if (startTime == null && endTime == null) {
      _clearErrors(startTimeControl, endTimeControl);
      return null;
    }
    if (startTime != null && endTime == null) {
      _setErrors(errorEnd, control, endControl: endTimeControl);
      return null;
    }
    if (endTime != null && startTime == null) {
      _setErrors(errorStart, control, startControl: startTimeControl);
      return null;
    }

    if (startTime == null || endTime == null) return null;

    _handleTimeComparison(
      control,
      startTimeControl,
      endTimeControl,
      startTime,
      endTime,
    );

    return null;
  }
}

class WorkDayInfoListValidator extends Validator<dynamic> {
  const WorkDayInfoListValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final formArray = control as FormArray<Map<String, Object?>>;

    final workInfoList = formArray.value ?? [];

    final availabilityValid = workInfoList.any(
      (workDay) {
        if (workDay == null) return false;
        final workDayInfo = WorkDayInfo.fromMap(workDay);
        final startTime = workDayInfo.startTime;
        final endTime = workDayInfo.endTime;
        if (startTime == null && endTime == null) return false;
        return startTime != null && endTime != null;
      },
    );

    return availabilityValid ? null : {ValidationMessage.required: true};
  }
}
