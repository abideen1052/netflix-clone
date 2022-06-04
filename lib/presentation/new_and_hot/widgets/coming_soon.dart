import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/constatnts/constant.dart';
import '../../home/widgets/custom_button.dart';

class ComingSoonWidget extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonWidget({
    Key? key,
    required this.id,
    required this.month,
    required this.day,
    required this.posterPath,
    required this.movieName,
    required this.description,
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
            children: [
              Text(
                month,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
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
              VideoWidget(url: posterPath),
              kHeight,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      movieName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  //const Spacer(),
                  const CustomButtonWidget(
                    icon: Icons.alarm,
                    title: "Remind Me",
                    iconSize: 19,
                    textSize: 14,
                  ),
                  kWidth,
                  const CustomButtonWidget(
                    icon: Icons.info,
                    title: 'Info',
                    iconSize: 19,
                    textSize: 14,
                  ),
                  kWidth
                ],
              ),
              Text('Coming on $month $day'),
              kHeight20,
              Text(
                movieName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              kHeight,
              Text(
                description,
                maxLines: 4,
                style: const TextStyle(
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
