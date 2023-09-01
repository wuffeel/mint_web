import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';

class MintThemeData {
  static const colorScheme = ColorScheme.light(
    primary: MintColors.primaryBlueColor,
    secondary: Colors.white,
    error: MintColors.errorColor,
  );

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
}
