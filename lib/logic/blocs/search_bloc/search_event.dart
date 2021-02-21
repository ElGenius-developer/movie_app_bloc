part of 'search_bloc.dart';

abstract class SearchEvent {}
class InitialSearchEvent extends SearchEvent {


 }
class FetchSearchResults extends SearchEvent {
  final String query;

  FetchSearchResults({@required this.query});
}

class FetchNewSearchResults extends SearchEvent {
  final String query;
  final int pageLength;

  FetchNewSearchResults({@required this.query, @required this.pageLength});
}
