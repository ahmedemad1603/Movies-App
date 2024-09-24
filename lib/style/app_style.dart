import 'package:flutter/material.dart';

class AppStyle{
  static const Color primaryColor= Color(0xffFFBB3B);
  static ThemeData darkMode = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      primary: primaryColor,
    ),
    scaffoldBackgroundColor: Colors.black,
  );
}