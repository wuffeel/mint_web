import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_bloc.dart';

part 'app_notifications_event.dart';

part 'app_notifications_state.dart';

@injectable
class AppNotificationsBlocWeb extends AppNotificationsBloc {
  AppNotificationsBlocWeb(
    super.getAppNotificationStreamUseCase,
    super.fetchChatRoomUseCase,
    super.markAppNotificationAsReadUseCase,
    super.clearAppNotificationsUseCase,
    super.userController,
  ) {
    on<AppNotificationsBookingDateChangeRequested>(
      _onBookingNotificationDateChange,
    );
  }

  void _onBookingNotificationDateChange(
    AppNotificationsBookingDateChangeRequested event,
    Emitter<AppNotificationsState> emit,
  ) {
    emit(
      AppNotificationsBookingDateChangeSuccess(
        event.bookingDate,
        todayNotifications: state.todayNotifications,
        previousNotifications: state.previousNotifications,
        unreadNotificationCount: state.unreadNotificationCount,
        isInitialized: state.isInitialized,
      ),
    );
  }
}
