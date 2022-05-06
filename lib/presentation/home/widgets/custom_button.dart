import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhiteColor,
          size: 28,
        ),
        Text(
          title,
          style: const TextStyle(
              color: kWhiteColor, fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
