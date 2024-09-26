import 'package:flutter/material.dart';

class AppStyle{
  static Color secondaryColor = const Color(0xff121312);
  static Color canvasColor = const Color(0xff1A1A1A);
  static Color primaryColor = const Color(0xffC6C6C6);
  static Color itemBackColor = const Color(0xff343534);
  static Color dateTypeColor = const Color(0xffB5B4B4);
  static Color bottomNavSelectedColor = const Color(0xffFFBB3B);
  static Color divider = const Color(0xFF707070);
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: secondaryColor,
      canvasColor: canvasColor,
      primaryColor: primaryColor,
      textTheme: TextTheme(
          titleLarge: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: dateTypeColor
          ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: primaryColor,
          selectedItemColor: bottomNavSelectedColor
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true
      )
  );

}