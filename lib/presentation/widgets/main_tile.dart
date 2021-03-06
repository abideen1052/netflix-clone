import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constatnts/constant.dart';

class MainTile extends StatelessWidget {
  final String imageUrl;
  const MainTile({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 105,
        height: 180,
        decoration: BoxDecoration(
          borderRadius: kRadius10,
          color: Colors.grey.withOpacity(0.2),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
