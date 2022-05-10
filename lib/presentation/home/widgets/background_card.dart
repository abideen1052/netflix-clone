import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://image.tmdb.org/t/p/original/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  icon: Icons.add,
                  title: 'My List',
                  iconSize: 28,
                  textSize: 18,
                ),
                _PlayButton(),
                const CustomButtonWidget(
                  icon: Icons.info,
                  title: 'Info',
                  iconSize: 28,
                  textSize: 18,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

TextButton _PlayButton() {
  return TextButton.icon(
    onPressed: () {},
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kWhiteButtonColor),
    ),
    icon: const Icon(
      Icons.play_arrow,
      size: 22,
      color: kBlackColor,
    ),
    label: const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        "Play",
        style: TextStyle(
          fontSize: 18,
          color: kBlackColor,
        ),
      ),
    ),
  );
}
