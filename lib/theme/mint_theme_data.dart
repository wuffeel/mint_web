import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../gen/colors.gen.dart';

class MintThemeData {
  static final elevatedButton = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: Size.fromHeight(50.h),
      backgroundColor: MintColors.primaryBlueColor,
      disabledBackgroundColor: MintColors.disabledButtonColor,
      foregroundColor: Colors.white,
      disabledForegroundColor: MintColors.scaffold,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      textStyle: TextStyle(
        fontSize: 17.sp,
        height: 1.3,
      ),
    ),
  );

  static final inputDecoration = InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.r),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
    errorStyle: TextStyle(fontSize: 12.sp, height: 1.3),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(8.r),
    ),
    hintStyle: TextStyle(
      fontSize: 17.sp,
      height: 1.3,
      letterSpacing: -0.01,
      color: MintColors.hintColor.withOpacity(0.3),
    ),
  );
}
