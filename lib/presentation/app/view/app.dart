import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/fonts.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../router/app_router.dart';
import '../../../theme/mint_theme_data.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 1024),
      builder: (context, _) {
        return MaterialApp.router(
          theme: ThemeData(
            fontFamily: MintFontFamily.inter,
            elevatedButtonTheme: MintThemeData.elevatedButton,
            inputDecorationTheme: MintThemeData.inputDecoration,
          ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          routerConfig: _appRouter.config(),
          supportedLocales: AppLocalizations.supportedLocales,
        );
      },
    );
  }
}
