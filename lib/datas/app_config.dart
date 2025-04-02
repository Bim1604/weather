import 'package:flutter/material.dart';
import 'package:untitled1/datas/app_color.dart';

class AppConfig {
  static ColorScheme colorScheme = ColorScheme(
    shadow: Colors.blue,
    brightness: Brightness.light,
    primary: AppColor.primaryBlueColor,
    onPrimary: AppColor.primaryBlueColor,
    secondary: AppColor.primaryGreyColor,
    onSecondary: AppColor.primaryGreyColor,
    tertiary: Colors.white,
    onTertiary: Colors.black,
    error: Colors.red,
    onError: Colors.redAccent,
    background: Colors.white,
    onBackground: Colors.white,
    surface: Colors.white,
    onSurface: Colors.white,
  );

  static TextTheme textTheme = const TextTheme(
    bodySmall: TextStyle(fontSize: 13, color: Colors.black, letterSpacing: 0, fontWeight: FontWeight.w400), // caption
    bodyLarge: TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 0, fontWeight: FontWeight.w400), // body 2
    bodyMedium: TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 0, fontWeight: FontWeight.w500), // body 1
    titleMedium: TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 0, fontWeight: FontWeight.w700), // subheader
    displaySmall: TextStyle(fontSize: 16, color: Colors.black, letterSpacing: 0, fontWeight: FontWeight.w700), // heading3
    displayMedium: TextStyle(fontSize: 18, color: Colors.black, letterSpacing: 0, fontWeight: FontWeight.w700), // heading2
    displayLarge: TextStyle(fontSize: 20, color: Colors.black, letterSpacing: 0, fontWeight: FontWeight.w700), // heading2
    titleSmall: TextStyle(fontSize: 14, color: Colors.black, letterSpacing: 0, fontWeight: FontWeight.w400), // heading2

  );
}