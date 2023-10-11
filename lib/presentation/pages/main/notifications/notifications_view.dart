import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../l10n/l10n.dart';
import '../../../../theme/mint_text_styles.dart';
import 'widgets/notification_tile.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  void _appNotificationsBlocListener(
    BuildContext context,
    AppNotificationsState state,
  ) {
    if (state is AppNotificationsFailure) {
      final l10n = context.l10n;
      switch (state.failureState) {
        case AppNotificationsFailureEnum.markAsRead:
          return;
        case AppNotificationsFailureEnum.clear:
        case AppNotificationsFailureEnum.fetchChat:
        case AppNotificationsFailureEnum.bookingData:
          _showFailureSnackBar(context, l10n.somethingWentWrong);
          break;
      }
    }
  }

  void _showFailureSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppNotificationsBloc, AppNotificationsState>(
      listener: _appNotificationsBlocListener,
      child: const _NotificationsOverlayView(),
    );
  }
}

class _NotificationsOverlayView extends StatelessWidget {
  const _NotificationsOverlayView();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Ink(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).hintColor.withOpacity(0.2),
              ),
            ),
          ),
          child: AppBar(
            actions: const [_MarkAllAsReadButton()],
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              context.l10n.notifications,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        Expanded(
          child: CustomScrollView(
            slivers: <Widget>[
              const _EmptyNotifications(),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 20),
                sliver: MultiSliver(
                  children: <Widget>[
                    const _TodayNotifications(),
                    const _PreviousNotifications(),
                  ]..insertBetween(
                      const SliverToBoxAdapter(child: SizedBox(height: 20)),
                    ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _EmptyNotifications extends StatelessWidget {
  const _EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppNotificationsBloc, AppNotificationsState, bool>(
      selector: (state) =>
          state.todayNotifications.isEmpty &&
          state.previousNotifications.isEmpty,
      builder: (context, isEmpty) => isEmpty
          ? SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  context.l10n.youDoNotHaveAnyNotifications,
                  style: MintTextStyles.body,
                ),
              ),
            )
          : const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}

class _TodayNotifications extends StatelessWidget {
  const _TodayNotifications();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocSelector<AppNotificationsBloc, AppNotificationsState,
        List<NotificationModel>>(
      selector: (state) => state.todayNotifications,
      builder: (context, todayNotifications) => todayNotifications.isNotEmpty
          ? SliverPadding(
              padding: const EdgeInsets.only(top: 20),
              sliver: _NotificationGroupList(
                groupTitle: l10n.today,
                notificationList: todayNotifications,
              ),
            )
          : const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}

class _PreviousNotifications extends StatelessWidget {
  const _PreviousNotifications();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocSelector<AppNotificationsBloc, AppNotificationsState,
        List<NotificationModel>>(
      selector: (state) => state.previousNotifications,
      builder: (context, previousNotifications) =>
          previousNotifications.isNotEmpty
              ? _NotificationGroupList(
                  groupTitle: l10n.previousNotifications,
                  notificationList: previousNotifications,
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}

class _NotificationGroupList extends StatelessWidget {
  const _NotificationGroupList({
    required this.groupTitle,
    required this.notificationList,
  });

  final String groupTitle;
  final List<NotificationModel> notificationList;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          sliver: SliverToBoxAdapter(
            child: Text(groupTitle, style: MintTextStyles.headline1),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 15)),
        SliverList.builder(
          itemCount: notificationList.length,
          itemBuilder: (context, index) => NotificationTile(
            notification: notificationList[index],
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 30,
              right: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _MarkAllAsReadButton extends StatelessWidget {
  const _MarkAllAsReadButton();

  void _markMessagesAsCleared(BuildContext context) {
    context.read<AppNotificationsBloc>().add(AppNotificationsClearRequested());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocSelector<AppNotificationsBloc, AppNotificationsState, bool>(
      selector: (state) => state.unreadNotificationCount != 0,
      builder: (context, hasUnread) {
        return hasUnread
            ? IconButton(
                onPressed: () => _markMessagesAsCleared(context),
                icon: const Icon(
                  Icons.check_circle_outline,
                  color: Colors.black,
                ),
                tooltip: l10n.markAllAsRead,
              )
            : const SizedBox.shrink();
      },
    );
  }
}
