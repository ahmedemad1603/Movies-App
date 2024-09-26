import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/ui/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'Splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2500),(){
      Navigator.pushNamedAndRemoveUntil(context, HomeScreen.routeName,(route)=> false );
    });
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          'assets/images/movies.svg',
        ),
      ),
    );
  }
}
