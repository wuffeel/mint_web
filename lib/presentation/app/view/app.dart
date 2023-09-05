import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../l10n/l10n.dart';
import '../../../router/app_router.dart';
import '../../../theme/mint_theme_data.dart';

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: MintThemeData.colorScheme,
        elevatedButtonTheme: MintThemeData.elevatedButton,
        fontFamily: MintFontFamily.inter,
        inputDecorationTheme: MintThemeData.inputDecoration,
        hintColor: MintColors.hintColor,
        scaffoldBackgroundColor: MintColors.scaffold,
        textTheme: MintThemeData.textTheme,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: _appRouter.config(),
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
