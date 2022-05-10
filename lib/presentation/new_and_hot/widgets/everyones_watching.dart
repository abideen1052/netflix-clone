import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/constatnts/constant.dart';
import '../../home/widgets/custom_button.dart';

class EveyonesWatchingWidget extends StatelessWidget {
  const EveyonesWatchingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        const Text(
          'Uncharted',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'A young street-smart, Nathan Drake and his wisecracking partner Victor “Sully” Sullivan embark on a dangerous pursuit of “the greatest treasure never found” while also tracking clues that may lead to Nathan’s long-lost brother.',
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        kHeight50,
        const VideoWidget(),
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
