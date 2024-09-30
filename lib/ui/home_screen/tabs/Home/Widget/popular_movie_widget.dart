import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/models/PopularResponse/Result.dart';
import 'package:movies_app/style/app_style.dart';

import '../../../../movie_detail_screen/movie_detail_screen.dart';

class PopularMovieWidget extends StatelessWidget
{
  List<Result>? popularMovie;

  PopularMovieWidget({
    super.key,
    required this.popularMovie
  });

  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieDetailScreen.routeName, arguments: popularMovie?[0].id);
      },
      child: Container(
        color: AppStyle.secondaryColor,
        child: Stack(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500${popularMovie?[0].backdropPath}',
              fit: BoxFit.cover,
              height: sizeHeight * 0.25,
              width: double.infinity,
            ),
            Positioned(
              height: sizeHeight * 0.20,
              left: sizeWidth * 0.02,
              bottom: sizeHeight * 0.01,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        "https://image.tmdb.org/t/p/w500${popularMovie?[0].posterPath}",
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              //todo: function to add movie to watch list
                            },
                            child: SvgPicture.asset("assets/images/bookmark.svg"),
                          ),
                        )
                      )
                    ]
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          popularMovie![0].title.toString(),
                          style: Theme.of(context).textTheme.titleLarge
                        ),
                        const SizedBox(height: 10),
                        Text(
                          popularMovie![0].releaseDate.toString(),
                          style: Theme.of(context).textTheme.titleSmall
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
