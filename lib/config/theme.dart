import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const MaterialColor primarycolor =
      MaterialColor(_primarycolorPrimaryValue, <int, Color>{
    50: Color(0xFFFFE0E0),
    100: Color(0xFFFFB3B3),
    200: Color(0xFFFF8080),
    300: Color(0xFFFF4D4D),
    400: Color(0xFFFF2626),
    500: Color(_primarycolorPrimaryValue),
    600: Color(0xFFFF0000),
    700: Color(0xFFFF0000),
    800: Color(0xFFFF0000),
    900: Color(0xFFFF0000),
  });
  static const int _primarycolorPrimaryValue = 0xFFFF0000;
  static ThemeData lightTheme = ThemeData(
    primarySwatch: primarycolor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      centerTitle: true,
      foregroundColor: AppColors.darkRedColor,
      elevation: 0,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.darkRedColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: AppColors.darkRedColor,
        unselectedItemColor: AppColors.greyColor),
  );
}

class AppColors {
  AppColors._();
  static const primaryColor = Color(0xFFFF0000);
  static const darkRedColor = Color(0xFFE50000);
  static const greyColor = Color(0xFFB4B8CA);
}

class AppTextStyle {
  AppTextStyle._();
  static TextStyle regular14({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        fontFamily: 'Metropolis',
        color: color ?? AppColors.greyColor);
  }

  static TextStyle regular16({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        fontFamily: 'Metropolis',
        color: color ?? AppColors.greyColor);
  }

  static TextStyle bold({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Metropolis',
        color: color ?? Colors.black);
  }

  static TextStyle whiteBold({Color? color}) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        fontFamily: 'Metropolis',
        color: color ?? Colors.black);
  }
}
