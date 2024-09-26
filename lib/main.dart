import 'package:flutter/material.dart';
import 'package:movies_app/style/app_style.dart';
import 'package:movies_app/ui/home_screen/home_screen.dart';
import 'package:movies_app/ui/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppStyle.lightTheme,
      themeMode: ThemeMode.dark,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
