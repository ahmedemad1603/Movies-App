import 'package:flutter/material.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/upcoming_item.dart';
import '../../../../../api/api_manager.dart';
import '../../../../../models/TopRated/TopRated.dart';
import '../../../../../models/TopRated/TopRatedResponse.dart';

class UpcomingListWidget extends StatelessWidget
{
  List<TopRated>? items;

  UpcomingListWidget({super.key});

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder<TopRatedResponse>(
      future: ApiManager.getTopRated(),
      builder: (context, snapshot)
      {
        if (snapshot.hasData)
        {
          items = snapshot.data!.results;
        }

        if (snapshot.hasError)
        {
          //Todo:in case Error retry
          return Center(child: Text('${snapshot.error}'));
        }

        if (snapshot.connectionState == ConnectionState.waiting)
        {
          return const Center(child: CircularProgressIndicator());
        }
        return Container(
          height: 130,
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return UpcomingItemWidget(items!.elementAt(index));
            },
            separatorBuilder: (context, index) => Container(
              width: 10,
            ),
            itemCount: items!.length,
            scrollDirection: Axis.horizontal,
          ),
        );
      },
    );
  }
}
