import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/models/MovieDetailsResponse/Genre.dart';
import 'package:movies_app/ui/movie_detail_screen/widgets/genres_grid_view.dart';
import 'package:movies_app/ui/movie_detail_screen/widgets/similar_section.dart';

import '../../style/app_style.dart';

class MovieDetailScreen extends StatelessWidget
{
  static const String routeName = "MovieDetailScreen";

  const MovieDetailScreen({super.key});


  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    num movieId = ModalRoute.of(context)!.settings.arguments as num;
    List<Genre>? genres;
    return Scaffold(
      appBar: AppBar(
        title: FutureBuilder(
          future: ApiManager.getMovieDetails(movieId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
            {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError || snapshot.data?.success == false)
            {
              return Center(child: Text('${snapshot.error}'));
            }
            var movie = snapshot.data!;
            return Text(
                movie.title??"",
                style: Theme.of(context).textTheme.displayLarge
            );
          },
        ),
        leading: IconButton(
          onPressed:  () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: ApiManager.getMovieDetails(movieId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError || snapshot.data?.success == false)
                {
                  return Center(child: Text('${snapshot.error}'));
                }
                var movie = snapshot.data!;
                num? runtime = movie.runtime;
                num? hours = (runtime! ~/ 60);
                num? min = (runtime % 60);
                genres = snapshot.data?.genres;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                      height: sizeHeight * 0.3,
                      width: double.infinity,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20, bottom: 10, top: 15),
                      child: Text(
                        movie.title ?? '',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 5),
                        child: Row(
                          children: [
                            Text(
                              movie.releaseDate ?? '',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              movie.adult == true ? 'PG-13' : 'R',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${hours}h ${min}m ',
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ],
                        )
                    ),
                    Container(
                      height: sizeHeight * 0.3,
                      width: sizeWidth,
                      padding: const EdgeInsets.only(
                          left: 20, bottom: 5, top: 7, right: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                                  height: sizeHeight * 0.25,
                                  width: sizeWidth * 0.4,
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
                            )
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GenresGridViewWidget(
                                  genres: genres
                                ),
                                Container(
                                  child: Text(
                                    movie.overview??"",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontSize: 13,
                                      color: const Color(0xffCBCBCB)
                                    ),
                                    maxLines: 5
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10.0),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/star.png"),
                                      const SizedBox(width: 6),
                                      Text(
                                        movie.voteAverage.toString(),
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 18),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            SimilarSectionWidget(movieId)
          ],
        ),
      ),
    );
  }
}
