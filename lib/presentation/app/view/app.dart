import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../l10n/l10n.dart';
import '../../../router/app_router.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) {
        return MaterialApp.router(
          theme: ThemeData(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routerConfig: _appRouter.config(),
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
