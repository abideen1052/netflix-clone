import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/application/hot_and_new/hotandnew_bloc.dart';
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
        body: const TabBarView(children: [
          ComingSoonList(
            key: Key('coming_soon'),
          ),
          EveryOneIsWatchingList(
            key: Key('everyone_is_watching'),
          )
        ]),
      ),
    );
  }
}

class ComingSoonList extends StatelessWidget {
  const ComingSoonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotandnewBloc>(context)
            .add(const LoadDataInComingSoon());
      },
    );

    return RefreshIndicator(
      onRefresh: () async {
        WidgetsBinding.instance!.addPostFrameCallback(
          (_) {
            BlocProvider.of<HotandnewBloc>(context)
                .add(const LoadDataInComingSoon());
          },
        );
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while getting data'),
            );
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.builder(
                padding: const EdgeInsets.only(top: 15),
                itemCount: state.comingSoonList.length,
                itemBuilder: (BuildContext context, index) {
                  final movie = state.comingSoonList[index];
                  if (movie.id == null) {
                    return const SizedBox();
                  }

                  String month = '';
                  String date = '';
                  try {
                    final _date = DateTime.tryParse(movie.releaseDate!);
                    final formatedDate =
                        DateFormat.yMMMMd('en_US').format(_date!);
                    month = formatedDate
                        .split(' ')
                        .first
                        .substring(0, 3)
                        .toUpperCase();
                    date = movie.releaseDate!.split('-')[1];
                  } catch (_) {
                    month = '';
                    date = '';
                  }

                  return ComingSoonWidget(
                    id: movie.id.toString(),
                    month: month,
                    day: date,
                    posterPath: '$imageAppendUrl${movie.posterPath}',
                    movieName: movie.originalTitle ?? 'No Title',
                    description: movie.overview ?? 'No Description',
                  );
                });
          }
        },
      ),
    );
  }
}

class EveryOneIsWatchingList extends StatelessWidget {
  const EveryOneIsWatchingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotandnewBloc>(context)
            .add(const LoadDataInEveryOneIsWatching());
      },
    );
    return RefreshIndicator(
      onRefresh: () async {
        WidgetsBinding.instance!.addPostFrameCallback(
          (_) {
            BlocProvider.of<HotandnewBloc>(context)
                .add(const LoadDataInEveryOneIsWatching());
          },
        );
      },
      child: BlocBuilder<HotandnewBloc, HotandnewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while getting data'),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: state.everyOneIsWatchingList.length,
                itemBuilder: (BuildContext context, index) {
                  final tv = state.everyOneIsWatchingList[index];
                  log(tv.originalName.toString());
                  if (tv.id == null) {
                    return const SizedBox();
                  }

                  return EveryonesWatchingWidget(
                    posterPath: '$imageAppendUrl${tv.posterPath}',
                    movieName: tv.originalName ?? 'No Title',
                    description: tv.overview ?? 'No Description',
                  );
                });
          }
        },
      ),
    );
  }
}
