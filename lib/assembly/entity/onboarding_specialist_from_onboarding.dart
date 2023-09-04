import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../domain/entity/onboarding/onboarding.dart';
import '../../domain/entity/onboarding_specialist/onboarding_specialist.dart';
import '../factory.dart';

@Injectable(as: Factory<OnboardingSpecialist?, Onboarding>)
class OnboardingSpecialistFromOnboarding
    implements Factory<OnboardingSpecialist?, Onboarding> {
  /// Converts a list of [WorkDayInfo] objects into a nested Map structure
  /// containing formatted work info as weekdays and their start and end times
  /// (in hh:mm a format, i.e. '0:00 AM/PM') in UTC.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// //  {
  /// //    'Monday':
  /// //    {
  /// //      'startTime': '8:00 AM',
  /// //      'endTime': '5:00 PM',
  /// //    },
  /// //  }
  /// final workInfoMap = _getWorkInfoMap(workInfoList);
  /// ```
  Map<String, Map<String, String>> _getWorkInfoMap(
    List<WorkDayInfo> workInfoList,
  ) {
    final workInfoMap = <String, Map<String, String>>{};
    for (final workDay in workInfoList) {
      final startTime = workDay.startTime;
      final endTime = workDay.endTime;
      if (startTime == null || endTime == null) continue;

      final startTimeHour = startTime.hour;
      final startTimeMinute = startTime.minute;
      final endTimeHour = endTime.hour;
      final endTimeMinute = endTime.minute;
      workInfoMap[workDay.weekday] = {
        'startTime': DateFormat.jm('en_US').format(
          DateTime(1, 1, 1, startTimeHour, startTimeMinute),
        ),
        'endTime': DateFormat.jm('en_US').format(
          DateTime(1, 1, 1, endTimeHour, endTimeMinute),
        ),
      };
    }
    return workInfoMap;
  }

  @override
  OnboardingSpecialist? create(Onboarding param) {
    final basicInfo = param.basicInfo;
    final experienceInfo = param.experienceInfo;

    final workInfoMap = _getWorkInfoMap(param.availability);

    final dateOfBirth = param.basicInfo.dateOfBirth;
    final noExperience = experienceInfo.noExperience;
    final experience = noExperience != null && noExperience
        ? DateTime.now()
        : experienceInfo.experience;

    if (dateOfBirth == null || experience == null) return null;

    return OnboardingSpecialist(
      dateOfBirth: dateOfBirth,
      email: basicInfo.email,
      experience: experience,
      firstName: basicInfo.firstName,
      lastName: basicInfo.lastName,
      phoneNumber: '',
      price: param.pricing,
      specializations: param.specializations,
      workInfo: workInfoMap,
      about: experienceInfo.about,
      education: experienceInfo.education,
    );
  }
}
