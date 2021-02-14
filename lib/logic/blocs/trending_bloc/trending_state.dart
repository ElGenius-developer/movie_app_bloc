part of 'trending_bloc.dart';

@immutable
abstract class TrendingState {}

class TrendingInitial extends TrendingState {}

class LoadingTrending extends TrendingState {}

// ignore: must_be_immutable
class SuccessLoadingTrend extends TrendingState {
  Movies trendingMovies;
  int index;

  SuccessLoadingTrend({@required this.trendingMovies});

  SuccessLoadingTrend.changed(
      {@required this.index, @required this.trendingMovies});
}

class ErrorLoadingTrend extends TrendingState {
  final String errorMessage;

  ErrorLoadingTrend(this.errorMessage);
}
