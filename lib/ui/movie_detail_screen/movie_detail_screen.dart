import 'package:flutter/material.dart';
import 'package:movies_app/models/NewReleasesResponse/NewReleaseMovie.dart';
import 'package:movies_app/models/PopularResponse/Result.dart';
import 'package:movies_app/models/TopRatedResponse/TopRatedMovie.dart';

class MovieDetailScreen extends StatelessWidget
{
  static const String routeName = "MovieDetailScreen";

  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    Result movie = ModalRoute.of(context)?.settings.arguments as Result;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
        title: Text(
          movie.title??"",
          style: Theme.of(context).textTheme.displayLarge
        ),
      ),
    );
  }
}
