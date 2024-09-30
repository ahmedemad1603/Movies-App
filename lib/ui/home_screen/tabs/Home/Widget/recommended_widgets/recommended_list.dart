import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:movies_app/models/TopRatedResponse/TopRatedMovie.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/recommended_widgets/recommended_item.dart';
import '../../../../../../api/api_manager.dart';

class RecommendedListWidget extends StatelessWidget
{
  const RecommendedListWidget({super.key});

  @override
  Widget build(BuildContext context)
  {
    double sizeHeight = MediaQuery.of(context).size.height;
    double sizeWidth = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: ApiManager.getTopRated(),
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
        List<TopRatedMovie>? topRatedList = snapshot.data?.results??[];
        return SizedBox(
          width: sizeWidth * 1,
          height: sizeHeight * 0.30,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemCount: topRatedList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => RecommendedItemWidget(topRatedList.elementAt(index)),
            separatorBuilder: (context, index) {
              return const SizedBox(width: 7);
            },
          ),
        );
      },
    );
  }
}
