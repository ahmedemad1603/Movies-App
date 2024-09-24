import 'package:flutter/material.dart';

class AppStyle{
  static const Color primaryColor= Color(0xffFFBB3B);
  static const Color secondaryColor = Color(0xff282A28);
  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
      secondary: secondaryColor
    ),
    scaffoldBackgroundColor: Colors.black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: primaryColor
    )
  );
}