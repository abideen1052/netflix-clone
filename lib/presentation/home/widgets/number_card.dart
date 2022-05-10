import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import '../../../core/constatnts/constant.dart';

class NumberCard extends StatelessWidget {
  final int index;
  const NumberCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
              height: 180,
            ),
            Container(
              width: 105,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                color: Colors.grey.withOpacity(0.2),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'http://image.tmdb.org/t/p/w154/lJA2RCMfsWoskqlQhXPSLFQGXEJ.jpg'),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 10,
          bottom: -25,
          child: BorderedText(
            strokeWidth: 4.0,
            strokeColor: Colors.white,
            child: Text(
              "${index + 1}",
              style: const TextStyle(
                fontSize: 120,
                letterSpacing: -18,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}
