import 'package:flutter/material.dart';
import 'package:movies_app/style/app_style.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/recommended_list.dart';

class RecommendedSectionWidget extends StatelessWidget
{
  const RecommendedSectionWidget({super.key});

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
          Container(padding: const EdgeInsets.all(10), child: const Text('Recommended')),
          Expanded(child: RecommendedListWidget()),
        ],
      ),
    );
  }
}
