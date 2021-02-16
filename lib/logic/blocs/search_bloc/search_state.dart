part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final Movies movies;

  SearchSuccess({@required this.movies});
}

class SearchError extends SearchState {
  final String error;

  SearchError({@required this.error});
}
