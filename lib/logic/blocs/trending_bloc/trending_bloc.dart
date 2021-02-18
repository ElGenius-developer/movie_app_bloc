import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:movies_app_with_BLoC/data/Repository/movies/movies_repository.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';

part 'trending_event.dart';
part 'trending_state.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  var _repository = MoviesRepository();
  static Movies trendingMovies;

  TrendingBloc() : super(TrendingInitial());

  @override
  Stream<TrendingState> mapEventToState(
    TrendingEvent event,
  ) async* {
    if (event is GetTrendingMovies) {
      yield LoadingTrending();
      try {
        trendingMovies = await _repository.getTrendingMovies();
        yield SuccessLoadingTrend(trendingMovies: trendingMovies);
      } catch (error) {
        yield ErrorLoadingTrend(error);
      }
    }
  }
}
