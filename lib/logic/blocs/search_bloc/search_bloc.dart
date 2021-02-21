import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/Repository/search/search_repository.dart';
import '../../../data/models/movies_model/moviesAPI.dart';
import '../../../data/models/movies_model/movies_details.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial());
  final _searchRepository = SearchRepository();
  static Movies _searchMovies = Movies();
  static final controller = TextEditingController(text: '');

  static Movies get searchMovies => _searchMovies;

  static List<MoviesDetails> get searchMoviesResults => _searchMovies.results;

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is FetchSearchResults) {
      yield SearchLoading();

      try {
        _searchMovies =
            await _searchRepository.getSearchMovies(query: event.query);
        if (_searchMovies.results.isEmpty)
          yield SearchError(error: "no data");
        else
          yield SearchSuccess(movies: _searchMovies);
      } catch (error) {
        yield SearchError(error: error.toString());
      }
    }
    else if (event is FetchNewSearchResults) {
      yield SearchLoading();
      try {
        for (int index; index < event.pageLength; index++) {
          await _searchRepository
              .getSearchMovies(query: event.query, page: index)
              .then((value) {
            _searchMovies.results.addAll(value.results);
          });
        }
        yield SearchSuccess(movies: _searchMovies);
      } catch (error) {
        yield SearchError(error: error.toString());
      }
    }
    else{
      yield SearchInitial();
    }
  }

  @override
  Future<Function> close() {
    controller.dispose();
    return super.close();
  }
}
