import 'package:flutter/material.dart';
import 'package:movies_app/models/SimilarResponse/SimilarMovie.dart';
import 'package:movies_app/ui/movie_detail_screen/widgets/similar_movie_item.dart';

import '../../../api/api_manager.dart';

class SimilarSectionWidget extends StatelessWidget
{
  num movieId;

  SimilarSectionWidget(this.movieId, {super.key});

  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
        future: ApiManager.getSimilar(movieId),
        builder: (ctx, snapshot)
        {
          if (snapshot.connectionState == ConnectionState.waiting)
          {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError || snapshot.data?.success == false)
          {
            return Center(child: Text('${snapshot.error}'));
          }
          List<SimilarMovie>? similarMovieList = snapshot.data?.results??[];
          return Container(
              color: const Color(0xff282A28),
              height: sizeHeight * 0.35,
              width: sizeWidth,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'More Like This',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 15)
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: sizeWidth * 1,
                          height: sizeHeight * 0.30,
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) => SimilarItemWidget(similarMovieList.elementAt(index)),
                            separatorBuilder: (context, index) {
                              return const SizedBox(width: 7);
                            },
                            itemCount: similarMovieList.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ]),
              )
          );
        }
      );
  }
}
