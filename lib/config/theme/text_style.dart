import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application_assignment/config/theme/colors.dart';

abstract class ThemeText {
  static TextStyle s29w800 = TextStyle(
    fontFamily: 'RobotoSlab',
    fontSize: 29.sp,
    fontWeight: FontWeight.w800,
    color: HexColor(HexColors.headerColor),
  );

  static TextStyle s20w300 = TextStyle(
    fontFamily: 'RobotoSlab',
    fontSize: 20.sp,
    fontWeight: FontWeight.w300,
    color: HexColor(HexColors.headlineColor),
  );

  static TextStyle s12w800 = TextStyle(
    fontFamily: 'RobotoSlab',
    fontSize: 12.sp,
    fontWeight: FontWeight.w800,
    color: HexColor(HexColors.subHeadlineClor),
  );
}
