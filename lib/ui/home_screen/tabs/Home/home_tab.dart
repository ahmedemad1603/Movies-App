import 'package:flutter/material.dart';
import 'package:movies_app/api/api_manager.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/popular_movie_widget.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/new_releases_widgets/new_release_section.dart';
import '../../../../models/PopularResponse/Result.dart';
import 'Widget/recommended_widgets/recommended_section.dart';

class HomeTab extends StatefulWidget
{
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab>
{
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
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: sizeHeight * 0.35,
              child: FutureBuilder(
                future: ApiManager.getPopular(),
                builder: (context, snapshot)
                {
                  if (snapshot.connectionState == ConnectionState.waiting)
                  {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError || snapshot.data?.success == false)
                  {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  List<Result>? popularMovies = snapshot.data?.results??[];
                  return PopularMovieWidget(popularMovie: popularMovies);
                },
              ),
            ),
            SizedBox(height: sizeHeight * 0.05),
            SizedBox(
              height: sizeHeight * 0.30,
              child: const NewReleaseSection()
            ),
            SizedBox(height: sizeHeight * 0.05),
            SizedBox(
              height: sizeHeight * 0.35,
              child: const RecommendedSectionWidget()
            )
          ],
        ),
      ),
    );
  }
}

