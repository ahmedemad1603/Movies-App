import 'package:flutter/material.dart';
import '../../../models/MovieDetailsResponse/Genre.dart';

class GenresGridViewWidget extends StatelessWidget
{
  List<Genre>? genres;

  GenresGridViewWidget({super.key, required this.genres});

  @override
  Widget build(BuildContext context)
  {
    return SizedBox(
      height: 80,
      width: 260,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            crossAxisSpacing: 5,
            childAspectRatio: 6.5 / 2.5),
        itemBuilder: (context, index) => Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Text(genres![index].name!,
              style: const TextStyle(color: Colors.white, fontSize: 10)),
        ),
        itemCount: genres!.length,
      ),
    );
  }
}
