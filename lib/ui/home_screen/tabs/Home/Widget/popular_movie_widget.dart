import 'package:flutter/material.dart';
import 'package:movies_app/models/TopRated/TopRated.dart';
import 'package:movies_app/style/app_style.dart';

class PopularMovieWidget extends StatelessWidget
{
  List<TopRated>? items;

  PopularMovieWidget({
    super.key,
    required this.items
  });

  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return Container(
      color: AppStyle.secondaryColor,
      height: sizeHeight * 0.35,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: sizeHeight * 0.25,
            decoration: const BoxDecoration(
              color: Colors.green
            ),
            child: Image.network(
              'https://image.tmdb.org/t/p/w500/${items?[0].backdropPath}',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              height: 170,
              width: 115,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/${items?[0].posterPath}",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items![0].title.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  items![0].releaseDate.toString(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            )
          )
        ],
      ),
    );
  }
}
