import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';

class MintTextStyles {
  static final sfProDisplay = TextStyle(
    fontFamily: MintFontFamily.sfProDisplay,
  );

  static final poppins = TextStyle(fontFamily: MintFontFamily.poppins);

  static final inter = TextStyle(fontFamily: MintFontFamily.inter);

  static final logo = TextStyle(
    fontFamily: MintFontFamily.poppins,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    color: MintColors.primaryBlueColor,
    height: 0.925,
  );

  static final title = TextStyle(
    fontSize: 50.sp,
    height: 1.1,
  );
}
