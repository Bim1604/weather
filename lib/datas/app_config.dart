import 'package:flutter/material.dart';
import 'package:untitled1/datas/app_color.dart';

class AppConfig {
  static TextTheme textTheme = TextTheme(
    titleMedium: TextStyle(fontSize: 54, color: AppColor.textColor, fontFamily: 'Roboto', fontWeight: FontWeight.w100, letterSpacing: 0),
    displayLarge: TextStyle(fontSize: 96, color: AppColor.textPrimaryColor, fontFamily: 'Roboto', fontWeight: FontWeight.w700, letterSpacing: 0, height: 1.2,),
    displayMedium: TextStyle(fontSize: 36, color: AppColor.textSecondaryColor, fontFamily: 'Roboto', fontWeight: FontWeight.w100, letterSpacing: 0, height: 1.4,),
    titleSmall: TextStyle(fontSize: 16, color: AppColor.textPrimaryColor, fontFamily: 'Roboto', letterSpacing: 0, fontWeight: FontWeight.w400, height: 1.2),
    labelLarge: TextStyle(fontSize: 20, color: AppColor.textColor, fontFamily: 'Roboto', letterSpacing: 0, fontWeight: FontWeight.w400, height: 1.2),
  );
}