import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import '../../../backbone/work_day_validation_messages.dart';

part 'onboarding.gform.dart';

@Rf()
class Onboarding {
  Onboarding({
    this.basicInfo,
    @RfControl(validators: [RequiredValidator()])
    this.specializations = const [],
    this.experienceInfo,
    @RfControl(validators: [MinValidator(1)]) this.pricing = 0,
    @RfArray<dynamic>() this.availability = const [],
  });

  final BasicInfo? basicInfo;
  final List<String> specializations;
  final ExperienceInfo? experienceInfo;
  final int pricing;
  final List<WorkDayInfo> availability;
}

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
@RfGroup<dynamic>()
class WorkDayInfo {
  WorkDayInfo({
    this.weekday = '',
    this.shortWeekday = '',
    @RfControl<TimeOfDay>() this.startTime,
    @RfControl<TimeOfDay>() this.endTime,
  });

  factory WorkDayInfo.fromMap(Map<String, dynamic> map) {
    return WorkDayInfo(
      weekday: map['weekday'] as String,
      shortWeekday: map['shortWeekday'] as String,
      startTime: map['startTime'] as TimeOfDay?,
      endTime: map['endTime'] as TimeOfDay?,
    );
  }

  /// Weekday name in English, e.g. 'Monday'.
  final String weekday;

  /// Short weekday name localized, e.g. 'Mon' for en_US
  final String shortWeekday;

  /// Start time of working day in 12-hour format, e.g. 0:00 AM.
  final TimeOfDay? startTime;

  /// End time of working day in 12-hour format, e.g. 0:00 AM.
  final TimeOfDay? endTime;
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

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    final errorStart = {WorkDayValidationMessages.startRequired: true};
    final errorEnd = {WorkDayValidationMessages.endRequired: true};
    final errorEqual = {WorkDayValidationMessages.timeEqual: true};
    final errorDifference = {WorkDayValidationMessages.lowDifference: true};

    final workInfo = WorkDayInfo.fromMap(control.value as Map<String, Object?>);
    final startTime = workInfo.startTime;
    final endTime = workInfo.endTime;

    if (startTime == null && endTime == null) {
      return null;
    } else if (startTime != null && endTime == null) {
      log('startTime != null && endTime == null');
      return errorEnd;
    } else if (endTime != null && startTime == null) {
      log('endTime != null && startTime == null');
      return errorStart;
    } else if (startTime != null && endTime != null) {
      if (startTime.hour == endTime.hour &&
          startTime.minute == endTime.minute) {
        log('startTime.hour == endTime.hour && startTime.minute == endTime.minute');
        return errorEqual;
      } else if (_minutesDifference(startTime, endTime) <
          _minConsultationMinutes) {
        log('_minutesDifference(startTime, endTime) < _minConsultationMinutes');

        return errorDifference;
      }
    }

    return null;
  }
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
