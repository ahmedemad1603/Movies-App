import 'package:flutter/material.dart';
import 'package:movies_app/ui/home_screen/tabs/Home/Widget/new_releases_widgets/new_release_list.dart';

class NewReleaseSection extends StatelessWidget
{
  const NewReleaseSection({super.key});

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
          const NewReleaseList(),
        ],
      ),
    );
  }
}
