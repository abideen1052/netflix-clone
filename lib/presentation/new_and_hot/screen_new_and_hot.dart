import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/home/widgets/custom_button.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/everyones_watching.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/video_widget.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

import '../../core/constatnts/constant.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(78),
            child: AppBar(
              title: const Text(
                'New & Hot',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                kWidth,
              ],
              bottom: TabBar(
                labelColor: kBlackColor,
                //isScrollable: true,
                unselectedLabelColor: kWhiteColor,
                labelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                indicator: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: kRadius30,
                ),
                tabs: const [
                  Tab(
                    text: '🍿 Coming Soon',
                  ),
                  Tab(
                    text: "👀 Everyone's Watching",
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(),
            _buildEveryonesWatching(),
          ])),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) => const ComingSoonWidget(),
    );
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, index) =>
          const EveyonesWatchingWidget(),
    );
  }
}
