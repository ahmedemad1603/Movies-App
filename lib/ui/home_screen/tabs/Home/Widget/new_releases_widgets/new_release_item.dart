import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/style/app_style.dart';
import 'package:movies_app/ui/movie_detail_screen/movie_detail_screen.dart';
import '../../../../../../models/NewReleasesResponse/NewReleaseMovie.dart';

class NewReleasesItem extends StatelessWidget
{
  NewReleaseMovie newReleaseMovie;

  NewReleasesItem(this.newReleaseMovie, {super.key});

  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          color: AppStyle.itemBackColor,
          width: 100,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, MovieDetailScreen.routeName, arguments: newReleaseMovie);
            },
            child: CachedNetworkImage(
              imageUrl: "https://image.tmdb.org/t/p/w500${newReleaseMovie.posterPath}",
              height: sizeHeight * 0.25,
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
      ],
    );
  }
}

// InkWell(
// onTap: () {
// Navigator.of(context).pushNamed(
// MovieDetailScreen.routeName,
// arguments: NewReleasesItem(newReleaseMovie)
// );
// },
// child: Container(
// width: 85,
// height: 130,
// decoration: const BoxDecoration(
// borderRadius: BorderRadius.all(Radius.circular(15)),
// ),
// child: ClipRRect(
// borderRadius: BorderRadius.all(Radius.circular(15)),
// child: Stack(
// alignment: Alignment.topLeft,
// children: [
// Image.network(
// 'https://image.tmdb.org/t/p/w500/${topRated.posterPath}',
// fit: BoxFit.cover,
// ),
// Positioned(
// top: 0,
// left: 0,
// child: SvgPicture.asset("assets/images/bookmark.svg")),
// ],
// ),
// ),
// ),
// )
