part of 'app_notifications_bloc_web.dart';

class AppNotificationsBookingDateChangeRequested extends AppNotificationsEvent {
  AppNotificationsBookingDateChangeRequested(this.bookingDate);

  final DateTime bookingDate;
}
