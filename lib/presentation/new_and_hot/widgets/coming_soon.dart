import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constatnts/constant.dart';
import '../../home/widgets/custom_button.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        SizedBox(
          width: 45,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                'FEB',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -2),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width - 45,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Doctor Strange',
                    style: TextStyle(
                      letterSpacing: -2,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  CustomButtonWidget(
                    icon: Icons.alarm,
                    title: "Remind Me",
                    iconSize: 19,
                    textSize: 14,
                  ),
                  kWidth,
                  CustomButtonWidget(
                    icon: Icons.info,
                    title: 'Info',
                    iconSize: 19,
                    textSize: 14,
                  ),
                  kWidth
                ],
              ),
              const Text('Coming on Friday'),
              kHeight20,
              const Text(
                'Doctor Strange',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              kHeight,
              const Text(
                'Doctor Strange, with the help of mystical allies both old and new, traverses the mind-bending and dangerous alternate realities of the Multiverse to confront a mysterious new adversary.',
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
