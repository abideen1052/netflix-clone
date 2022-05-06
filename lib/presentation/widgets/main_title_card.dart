import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/widgets/main_tile.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class MainTitleTileWidget extends StatelessWidget {
  final String title;
  const MainTitleTileWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MainTitle(
            title: title,
          ),
          LimitedBox(
            maxHeight: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) {
                return const MainTile();
              }),
            ),
          )
        ],
      ),
    );
  }
}
