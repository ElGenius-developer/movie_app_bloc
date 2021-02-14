import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app_with_BLoC/data/Repository/movies/movies_repository.dart';
import 'package:movies_app_with_BLoC/data/models/credits_model/cast.dart';
import 'package:movies_app_with_BLoC/data/models/credits_model/credits.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';

part 'movies_events.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  static Movies _movies;
  int categoryNumber = 0;

  static Movies get movies => _movies;
  static var credits = Credits();
  MoviesRepository moviesRepository = MoviesRepository();

  MoviesBloc({MoviesRepository moviesRepository}) : super(InitialState());

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is FetchingData) {
      //emit the loading state First...
      yield LoadingState();
      try {
        _movies = await moviesRepository.getData(category: event.category);
        yield SuccessState(movies: movies);
      } catch (e) {
        yield ErrorState(errorMessage: "Failed to load ");
      }
    } else if (event is ChangeCategory) {
      yield LoadingState();
      try {
        _movies = await moviesRepository.getData(
            category: event.category, pageNumber: 1);
        yield SuccessState(movies: movies);
      } catch (e) {
        yield ErrorState(errorMessage: e.message);
      }
    } else if (event is ChangePageNumber) {
      yield LoadingState();
      try {
        _movies = await moviesRepository.getData(
            category: event.category, pageNumber: event.pageNumber);
        yield SuccessState(movies: movies);
      } catch (e) {
        yield ErrorState(errorMessage: e.message);
      }
    }
  }
}
