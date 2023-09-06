import 'package:flutter/material.dart';

import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';

class MintTextStyles {
  static const sfProDisplay = TextStyle(
    fontFamily: MintFontFamily.sfProDisplay,
  );

  static const poppins = TextStyle(fontFamily: MintFontFamily.poppins);

  static const inter = TextStyle(fontFamily: MintFontFamily.inter);

  static const logo = TextStyle(
    fontFamily: MintFontFamily.poppins,
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: MintColors.primaryBlueColor,
    height: 0.925,
  );

  static const title = TextStyle(
    fontSize: 50,
    height: 1.1,
    fontWeight: FontWeight.w500,
  );

  static const body = TextStyle(
    fontSize: 17,
    height: 1.3,
    letterSpacing: -0.01,
  );

  static const headline1 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static const error = TextStyle(
    fontSize: 12,
    height: 1.3,
    color: MintColors.errorColor,
  );

  static const figure = TextStyle(
    fontSize: 15,
    height: 1.3,
  );

  static const tagBig = TextStyle(
    fontSize: 16,
    height: 1.3,
  );

  static const tagSmall = TextStyle(
    fontSize: 13,
    height: 1.4,
  );

  static const medium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const hint = TextStyle(
    fontSize: 16,
    height: 1.5,
    color: MintColors.lightGrey,
  );
}
