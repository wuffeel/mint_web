import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../router/app_router.gr.dart';
import '../../../../bloc/user/user_bloc.dart';
import '../../../../widgets/mint_circle_avatar.dart';
import '../../../../widgets/mint_logo.dart';
import '../../notifications/notifications_view.dart';
import 'navigation_link.dart';

class NavigationAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NavigationAppBar({
    required this.tabsRouter,
    required this.isNotificationsVisible,
    required this.onNotificationClick,
    super.key,
  });

  final TabsRouter tabsRouter;
  final bool isNotificationsVisible;
  final VoidCallback onNotificationClick;

  @override
  Size get preferredSize => const Size.fromHeight(72);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final links = <String>[
      l10n.home,
      l10n.patients,
      l10n.appointments,
      l10n.messages,
    ];
    return _NavigationAppBarDecoration(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _NavigationToolbar(links: links, tabsRouter: tabsRouter),
          _UserToolbar(
            isNotificationsVisible: isNotificationsVisible,
            onNotificationClick: onNotificationClick,
          ),
        ],
      ),
    );
  }
}

class _NavigationAppBarDecoration extends StatelessWidget {
  const _NavigationAppBarDecoration({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 14,
            color: MintColors.elevation.withOpacity(0.08),
            offset: const Offset(0, 2),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: child,
      ),
    );
  }
}

class _NavigationToolbar extends StatelessWidget {
  const _NavigationToolbar({required this.links, required this.tabsRouter});

  final List<String> links;
  final TabsRouter tabsRouter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        MintLogo(
          onTap: () => context.router.navigate(const HomeRoute()),
          padding: const EdgeInsets.all(8),
        ),
        const SizedBox(width: 60),
        ...List.generate(
          links.length,
          (index) => NavigationLink(
            title: links[index],
            isCurrent: index == tabsRouter.activeIndex,
            onTap: () => tabsRouter.setActiveIndex(index),
          ),
        )..insertBetween(const SizedBox(width: 30)),
      ],
    );
  }
}

class _UserToolbar extends StatelessWidget {
  const _UserToolbar({
    required this.isNotificationsVisible,
    required this.onNotificationClick,
  });

  final bool isNotificationsVisible;
  final VoidCallback onNotificationClick;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      children: <Widget>[
        _NotificationsBellPortal(
          isNotificationsVisible: isNotificationsVisible,
          onNotificationClick: onNotificationClick,
        ),
        const SizedBox(width: 30),
        BlocBuilder<UserBloc, UserState>(
          builder: (context, state) => PopupMenuButton<String>(
            itemBuilder: (context) => [
              PopupMenuItem<String>(
                value: l10n.logOut,
                onTap: () =>
                    context.read<UserBloc>().add(UserLogOutRequested()),
                child: Text(
                  l10n.logOut,
                  style: const TextStyle(color: MintColors.errorColor),
                ),
              ),
            ],
            constraints: const BoxConstraints(),
            offset: const Offset(0, 11),
            padding: EdgeInsets.zero,
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            tooltip: '',
            child: MintCircleAvatar(
              radius: 21,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              photoUrl: state is UserAuthenticated ? state.user.photoUrl : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _NotificationsBellPortal extends StatelessWidget {
  const _NotificationsBellPortal({
    required this.isNotificationsVisible,
    required this.onNotificationClick,
  });

  final bool isNotificationsVisible;
  final VoidCallback onNotificationClick;

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: isNotificationsVisible,
      portalFollower: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onNotificationClick,
      ),
      child: PortalTarget(
        anchor: const Aligned(
          follower: Alignment.topRight,
          target: Alignment.bottomLeft,
        ),
        visible: isNotificationsVisible,
        portalFollower: const Material(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          color: Colors.white,
          clipBehavior: Clip.hardEdge,
          elevation: 8,
          child: SizedBox(
            width: 550,
            height: 500,
            child: NotificationsView(),
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onNotificationClick,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: _NotificationsBellIcon(),
            ),
          ),
        ),
      ),
    );
  }
}

class _NotificationsBellIcon extends StatelessWidget {
  const _NotificationsBellIcon();

  @override
  Widget build(BuildContext context) {
    final bellWidget = Assets.svg.bellIcon.svg(
      width: 24,
      height: 24,
      colorFilter: const ColorFilter.mode(
        MintColors.bellGrey,
        BlendMode.srcIn,
      ),
    );
    return BlocSelector<AppNotificationsBloc, AppNotificationsState, int>(
      selector: (state) => state.unreadNotificationCount,
      builder: (context, unreadNotifications) {
        if (unreadNotifications != 0) {
          return Badge(
            backgroundColor: Theme.of(context).colorScheme.primary,
            smallSize: 9,
            label: Text(
              unreadNotifications.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: bellWidget,
          );
        }
        return bellWidget;
      },
    );
  }
}
