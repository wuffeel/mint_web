import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';

import '../../../../gen/colors.gen.dart';
import '../../../../router/app_router.gr.dart';
import 'widgets/navigation_app_bar.dart';

@RoutePage()
class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  bool _isNotificationsVisible = false;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: AutoTabsScaffold(
        routes: [
          const HomeRoute(),
          const PatientsRoute(),
          const AppointmentsRoute(),
          MessagesRoute(),
        ],
        animationDuration: Duration.zero,
        appBarBuilder: (context, tabsRouter) => NavigationAppBar(
          tabsRouter: tabsRouter,
          isNotificationsVisible: _isNotificationsVisible,
          onNotificationClick: () => setState(
            () => _isNotificationsVisible = !_isNotificationsVisible,
          ),
        ),
        backgroundColor: MintColors.scaffold,
      ),
    );
  }
}
