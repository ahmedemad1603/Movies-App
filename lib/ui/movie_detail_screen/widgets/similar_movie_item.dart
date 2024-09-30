import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/models/SimilarResponse/SimilarMovie.dart';
import 'package:movies_app/models/TopRatedResponse/TopRatedMovie.dart';
import 'package:movies_app/style/app_style.dart';
import 'package:movies_app/ui/movie_detail_screen/movie_detail_screen.dart';

class SimilarItemWidget extends StatelessWidget
{
  SimilarMovie similarMovie;

  SimilarItemWidget(this.similarMovie, {super.key});

  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 130,
      decoration: BoxDecoration(
        color: AppStyle.itemBackColor,
        borderRadius: BorderRadiusDirectional.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MovieDetailScreen.routeName, arguments: similarMovie.id);
                },
                child: CachedNetworkImage(
                  imageUrl: "https://image.tmdb.org/t/p/w500${similarMovie.posterPath}",
                  height: sizeHeight * 0.20,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover
                          ),
                          borderRadius: const BorderRadiusDirectional.only(
                              topStart: Radius.circular(5),
                              topEnd: Radius.circular(5)
                          )
                      ),
                    );
                  },
                  placeholder: (context, url) {
                    return Center(child: CircularProgressIndicator(color: AppStyle.bottomNavSelectedColor));
                  },
                  errorWidget: (context, url, error) {
                    return Center(child: Icon(Icons.broken_image_outlined, color: AppStyle.bottomNavSelectedColor));
                  },
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                    onTap: () {
                      //todo: function to add movie to watch list
                    },
                    child: SvgPicture.asset("assets/images/bookmark.svg")
                ),
              )
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/star.png"),
                    const SizedBox(width: 10),
                    Text(
                        similarMovie.popularity.toString(),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                    similarMovie.title.toString(),
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.white)
                ),
                const SizedBox(height: 5),
                Text(
                    similarMovie.releaseDate.toString(),
                    style: Theme.of(context).textTheme.titleSmall
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
