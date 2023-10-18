import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import 'mint_text_styles.dart';

class MintThemeData {
  static const colorScheme = ColorScheme.light(
    primary: MintColors.primaryBlueColor,
    secondary: Colors.white,
    error: MintColors.errorColor,
  );

  static const dividerTheme = DividerThemeData(thickness: 1, space: 1);

  static final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: MintColors.primaryBlueColor,
      disabledBackgroundColor: MintColors.disabledButtonColor,
      disabledForegroundColor: MintColors.scaffold,
      elevation: 0,
      foregroundColor: Colors.white,
      minimumSize: const Size.fromHeight(50),
      padding: const EdgeInsets.symmetric(vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      textStyle: const TextStyle(
        fontSize: 17,
        height: 1.3,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static final inputDecoration = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    errorStyle: const TextStyle(fontSize: 12, height: 1.3),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: MintColors.errorColor),
      borderRadius: BorderRadius.circular(8),
    ),
    hintStyle: TextStyle(
      fontSize: 17,
      height: 1.3,
      letterSpacing: -0.01,
      color: MintColors.hintColor.withOpacity(0.3),
    ),
    hoverColor: Colors.white,
  );

  static final outlinedButton = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      minimumSize: const Size.fromHeight(50),
      foregroundColor: Colors.black,
      disabledForegroundColor: Colors.black.withOpacity(0.4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      side: const BorderSide(color: MintColors.primaryBlueColor),
      textStyle: MintTextStyles.headline1,
    ),
  );

  static final textTheme = const TextTheme().apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  );
}
