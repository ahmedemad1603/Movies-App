import 'package:flutter/material.dart';
import 'package:movies_app/models/NewReleasesResponse/NewReleaseMovie.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/new_releases_widgets/new_release_item.dart';
import '../../../../../../api/api_manager.dart';

class NewReleaseList extends StatelessWidget
{
  const NewReleaseList({super.key});

  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ApiManager.getNewReleases(),
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
        List<NewReleaseMovie>? newReleaseList = snapshot.data?.results??[];
        return SizedBox(
          width: sizeWidth * 1,
          height: sizeHeight * 0.24,
          child: ListView.separated(
            itemBuilder: (context, index) => NewReleasesItem(newReleaseList.elementAt(index)),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 7);
            },
            itemCount: newReleaseList.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}

// Container(
// height: 130,
// child: ListView.separated(
// physics: BouncingScrollPhysics(),
// itemBuilder: (BuildContext context, int index) {
// return UpcomingItemWidget(items!.elementAt(index));
// },
// separatorBuilder: (context, index) => Container(
// width: 10,
// ),
// itemCount: items!.length,
// scrollDirection: Axis.horizontal,
// ),
// )