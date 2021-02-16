part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}

class FetchSearchResults extends SearchEvent {
  final String query;

  FetchSearchResults({@required this.query});
  @override
  List<Object> get props => [query];
}

class FetchNewSearchResults extends SearchEvent {
  final String query;
  final int pageLength;
  FetchNewSearchResults({@required this.query, @required this.pageLength});
  @override
  List<Object> get props => [query];
}
