import 'package:flutter/material.dart';
import 'package:movies_app/style/app_style.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/recommended_widgets/recommended_list.dart';

class RecommendedSectionWidget extends StatelessWidget
{
  const RecommendedSectionWidget({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
              "New Releases",
              style: Theme.of(context).textTheme.titleLarge
          ),
          const SizedBox(height: 5),
          const RecommendedListWidget(),
        ],
      ),
    );
  }
}
