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
    height: 1.2,
    letterSpacing: -0.01,
  );
}
