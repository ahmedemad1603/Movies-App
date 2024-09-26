import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/models/PopularMovies/PopularMovies.dart';
import 'package:movies_app/models/TopRated/TopRated.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/popular_movie_widget.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/recommended_section.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/upcoming_section.dart';

class HomeTab extends StatefulWidget
{
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab>
{
  late List<TopRated>? items;

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          FutureBuilder<PopularMovies>(
            future: ApiManager.getPopular(),
            builder: (context, snapshot)
            {
              if (snapshot.hasData)
              {
                items = snapshot.data!.results?.cast<TopRated>();
              }
              if (snapshot.hasError)
              {
                return Center(child: Text('${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting)
              {
                return const Center(child: CircularProgressIndicator());
              }
              return PopularMovieWidget(items: items);
            },
          ),
          const SizedBox(height: 10),
           Expanded(
            child: UpcomingSectionWidget()
          ),
          const SizedBox(height: 5),
           Expanded(
              child: RecommendedSectionWidget()
          )
        ],
      ),
    );
  }
}

