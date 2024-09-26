import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/models/TopRated/TopRated.dart';

class RecommendedItemWidget extends StatelessWidget
{
  TopRated topRated;

  RecommendedItemWidget(this.topRated);

  @override
  Widget build(BuildContext context)
  {
    return Container(
      width: 85,
      height: 130,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
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
    );
  }
}
