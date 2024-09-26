import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/models/TopRated/TopRated.dart';
import 'package:movies_app/ui/movie_detail_screen/movie_detail_screen.dart';

class UpcomingItemWidget extends StatelessWidget
{
  TopRated topRated;

  UpcomingItemWidget(this.topRated);

  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
            MovieDetailScreen.routeName,
            arguments: UpcomingItemWidget(topRated)
        );
      },
      child: Container(
        width: 85,
        height: 130,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Image.network(
                'https://image.tmdb.org/t/p/w500/${topRated.posterPath}',
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 0,
                  left: 0,
                  child: SvgPicture.asset("assets/images/bookmark.svg")),
            ],
          ),
        ),
      ),
    );
  }
}
