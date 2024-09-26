import 'package:flutter/material.dart';
import 'package:movies_app/models/Movie.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/home_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Center(child: MovieItem(movie: Movie(
          posterPath: "/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg"
      ))),
    );
  }
}
