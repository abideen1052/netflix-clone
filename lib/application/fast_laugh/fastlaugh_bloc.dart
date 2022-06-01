import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';
import 'package:netflix_clone/domain/downloads/models/downloads.dart';

part 'fastlaugh_event.dart';
part 'fastlaugh_state.dart';
part 'fastlaugh_bloc.freezed.dart';

final dummyVideoUrls = [
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4'
];
ValueNotifier<Set<int>> likedVideoIdNotifier = ValueNotifier({});

@injectable
class FastlaughBloc extends Bloc<FastlaughEvent, FastlaughState> {
  FastlaughBloc(
    IDowloadsRepo _downloadService,
  ) : super(FastlaughState.initial()) {
    on<Initialize>((event, emit) async {
      // dending losding to ui
      emit(const FastlaughState(
        videoList: [],
        isLoading: true,
        isError: false,
      ));
      //get trending movies
      final _result = await _downloadService.getDownloadImages();
      final _state = _result.fold((l) {
        return FastlaughState(
          videoList: [],
          isLoading: false,
          isError: true,
        );
      }, (resp) {
        return FastlaughState(
          videoList: resp,
          isLoading: false,
          isError: false,
        );
      });

      //send to ui
      emit(_state);
    });
    on<LikedVideo>((event, emit) async {
      likedVideoIdNotifier.value.add(event.id);
      likedVideoIdNotifier.notifyListeners();
    });
    on<UnlikedVideo>((event, emit) async {
      likedVideoIdNotifier.value.remove(event.id);
      likedVideoIdNotifier.notifyListeners();
    });
  }
}
