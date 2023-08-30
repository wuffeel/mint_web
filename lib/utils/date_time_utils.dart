import 'package:cloud_firestore/cloud_firestore.dart';

class DateTimeUtils {
  static DateTime convertToDateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    } else if (value is Timestamp) {
      return value.toDate();
    } else if (value is String) {
      return DateTime.parse(value);
    }
    throw ArgumentError.value(value);
  }

  static DateTime? tryConvertToDateTime(dynamic value) {
    if (value is DateTime) {
      return value;
    } else if (value is Timestamp) {
      return value.toDate();
    } else if (value is String) {
      return DateTime.parse(value);
    }
    return null;
  }

  static DateTime findMostRecentSunday(DateTime currentDate) {
    final daysSinceSunday = (currentDate.weekday + 7 - DateTime.sunday) % 7;
    final mostRecentSunday = currentDate.subtract(
      Duration(days: daysSinceSunday),
    );
    return mostRecentSunday;
  }
}
