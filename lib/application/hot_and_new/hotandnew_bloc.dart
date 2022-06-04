import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/hot_and_new/hot_and_new_service.dart';
import 'package:netflix_clone/domain/hot_and_new/model/hot_and_new.dart';

part 'hotandnew_event.dart';
part 'hotandnew_state.dart';
part 'hotandnew_bloc.freezed.dart';

@injectable
class HotandnewBloc extends Bloc<HotandnewEvent, HotandnewState> {
  final HotAndNewService _hotAndNewService;
  HotandnewBloc(this._hotAndNewService) : super(HotandnewState.initial()) {
    //get hotandnew movie data
    on<LoadDataInComingSoon>((event, emit) async {
      //send loading to ui
      emit(const HotandnewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        isError: false,
      ));
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewMovieData();
      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotandnewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNew response) {
        return HotandnewState(
          comingSoonList: response.results,
          everyOneIsWatchingList: state.everyOneIsWatchingList,
          isLoading: false,
          isError: false,
        );
      });
      emit(newState);
    });

    //get hotandnew tv data
    on<LoadDataInEveryOneIsWatching>((event, emit) async {
//send loading to ui
      emit(const HotandnewState(
        comingSoonList: [],
        everyOneIsWatchingList: [],
        isLoading: true,
        isError: false,
      ));
      //get data from remote
      final _result = await _hotAndNewService.getHotAndNewTvData();
      //data to state
      final newState = _result.fold((MainFailure failure) {
        return const HotandnewState(
          comingSoonList: [],
          everyOneIsWatchingList: [],
          isLoading: false,
          isError: true,
        );
      }, (HotAndNew response) {
        return HotandnewState(
          comingSoonList: state.comingSoonList,
          everyOneIsWatchingList: response.results,
          isLoading: false,
          isError: false,
        );
      });
      emit(newState);
    });
  }
}
