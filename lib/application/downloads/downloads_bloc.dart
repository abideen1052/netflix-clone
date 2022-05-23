import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:netflix_clone/domain/core/failures/main_failure.dart';
import 'package:netflix_clone/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads.dart';
part 'downloads_bloc.freezed.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDowloadsRepo _downloadsRepo;
  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownlodsImage>(
      (event, emit) async {
        emit(
          state.copyWith(
            isLoading: true,
            downloadsFailureSuccesOption: none(),
          ),
        );
        final Either<MainFailure, List<Downloads>> downloadsOption =
            await _downloadsRepo.getDownloadImages();
        log(downloadsOption.toString());
        emit(
          downloadsOption.fold(
            (failure) => state.copyWith(
                isLoading: false,
                downloadsFailureSuccesOption: Some(
                  Left(failure),
                )),
            (success) => state.copyWith(
                isLoading: false,
                downloads: success,
                downloadsFailureSuccesOption: Some(
                  Right(success),
                )),
          ),
        );
      },
    );
  }
}