import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constatnts/constant.dart';
import '../../widgets/main_title.dart';
import 'number_card.dart';

class NumberTitleCard extends StatelessWidget {
  final List<String> posterPath;
  const NumberTitleCard({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(
            title: 'Top 10 shows in India',
          ),
          kHeight,
          LimitedBox(
            maxHeight: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) {
                return NumberCard(
                  index: index,
                  imgUrl: posterPath[index],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
