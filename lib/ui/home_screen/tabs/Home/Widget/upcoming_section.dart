import 'package:flutter/material.dart';
import 'package:movies_app/style/app_style.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/upcoming_list.dart';

class UpcomingSectionWidget extends StatelessWidget
{
  const UpcomingSectionWidget({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Container(
      color: AppStyle.divider,
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(10),
              child: const Text('New Releases')
          ),
          Expanded(child: UpcomingListWidget()),
        ],
      ),
    );
  }
}
