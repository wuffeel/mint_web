import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../gen/colors.gen.dart';
import '../../../../router/app_router.gr.dart';
import 'widgets/navigation_app_bar.dart';

@RoutePage()
class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        PatientsRoute(),
        AppointmentsRoute(),
        MessagesRoute(),
      ],
      animationDuration: Duration.zero,
      appBarBuilder: (context, tabsRouter) => NavigationAppBar(
        tabsRouter: tabsRouter,
      ),
      backgroundColor: MintColors.scaffold,
    );
  }
}
