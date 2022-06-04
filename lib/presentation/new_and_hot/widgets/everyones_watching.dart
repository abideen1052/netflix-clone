import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/constatnts/constant.dart';
import '../../home/widgets/custom_button.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  final String posterPath;
  final String movieName;
  final String description;
  const EveryonesWatchingWidget({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieName,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          description,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        kHeight50,
        VideoWidget(
          url: posterPath,
        ),
        kHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 26,
              textSize: 14,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 26,
              textSize: 14,
            ),
            kWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 26,
              textSize: 14,
            ),
            kWidth
          ],
        )
      ],
    );
  }
}
