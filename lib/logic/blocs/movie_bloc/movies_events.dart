part of 'movies_bloc.dart';

abstract class MoviesEvent {}

class FetchingData extends MoviesEvent {
  final String category;

  FetchingData({@required this.category});
}

class ChangeCategory extends MoviesEvent {
  final String category;

  ChangeCategory({@required this.category});
}

class ChangePageNumber extends MoviesEvent {
  final String category;
  final int pageNumber;

  ChangePageNumber({
    @required this.category,
    this.pageNumber,
  });
}
