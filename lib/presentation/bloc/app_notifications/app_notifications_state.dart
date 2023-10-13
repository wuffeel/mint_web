part of 'app_notifications_bloc_web.dart';

class AppNotificationsBookingDateChangeSuccess extends AppNotificationsState {
  const AppNotificationsBookingDateChangeSuccess(
    this.bookingDate, {
    super.todayNotifications,
    super.previousNotifications,
    super.unreadNotificationCount,
    super.loadingMessageId,
    super.isInitialized,
  });

  final DateTime bookingDate;
}
