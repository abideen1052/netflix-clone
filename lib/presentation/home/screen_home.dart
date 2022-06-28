import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_clone/application/home/home_bloc.dart';

import 'package:netflix_clone/core/constatnts/constant.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import '../widgets/main_title_card.dart';
import 'widgets/number_tile_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<HomeBloc>(context).add(const LoadHomeScreenData());
    });
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;

            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    );
                  } else if (state.isError) {
                    return const Center(
                      child: Text(
                        'Error while getting data',
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }

                  //released past year
                  final _releasedPastYear = state.pastYearMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _releasedPastYear.shuffle();

                  //trending
                  final _trending = state.trendingMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _trending.shuffle();

                  //tense dramas

                  final _tenseDramas = state.tenseDramaMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _tenseDramas.shuffle();

                  //south indian movies

                  final _southIndianMovies = state.trendingMovieList.map((m) {
                    return '$imageAppendUrl${m.posterPath}';
                  }).toList();
                  _southIndianMovies.shuffle();

                  //top 10 Tv Shows

                  final _top10TvShows = state.trendingMovieList.map((t) {
                    return '$imageAppendUrl${t.posterPath}';
                  }).toList();
                  _top10TvShows.shuffle();

                  //List view
                  return ListView(
                    children: [
                      const BackgroundCard(),
                      kHeight,
                      MainTitleTileWidget(
                        title: "Released in the past Year",
                        posterList: _releasedPastYear,
                      ),
                      kHeight,
                      MainTitleTileWidget(
                        title: "Trending Now",
                        posterList: _trending,
                      ),
                      kHeight,
                      NumberTitleCard(
                        posterPath: _top10TvShows,
                      ),
                      kHeight,
                      MainTitleTileWidget(
                        title: "Tense Dramas",
                        posterList: _tenseDramas,
                      ),
                      kHeight,
                      MainTitleTileWidget(
                        title: "South Indian Cinema",
                        posterList: _southIndianMovies,
                      ),
                      kHeight
                    ],
                  );
                },
              ),
              scrollNotifier.value == true
                  ? AnimatedContainer(
                      duration: Duration(milliseconds: 1000),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'https://cdn-images-1.medium.com/max/1200/1*ty4NvNrGg4ReETxqU2N3Og.png',
                                height: 60,
                                width: 60,
                              ),
                              const Spacer(),
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
                              kWidth
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('TV Shows', style: kHomeTitleText),
                              Text(
                                'Movies',
                                style: kHomeTitleText,
                              ),
                              Text(
                                'Categoreis',
                                style: kHomeTitleText,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight,
            ],
          ),
        );
      },
    ));
  }
}
