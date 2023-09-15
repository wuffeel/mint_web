import '../backbone/consultation_status.dart';

class ConsultationStatusUtil {
  static ConsultationStatus statusByDateTime(
    DateTime dateTime, {
    int consultationMinutes = 60,
  }) {
    final now = DateTime.now();
    final endTime = dateTime.add(Duration(minutes: consultationMinutes));
    if (now.isBefore(dateTime)) {
      return ConsultationStatus.upcoming;
    } else if (now.isBefore(endTime)) {
      return ConsultationStatus.current;
    } else {
      return ConsultationStatus.completed;
    }
  }
}
