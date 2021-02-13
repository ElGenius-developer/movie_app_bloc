part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class FetchingData extends MoviesEvent {
  final String category;

  FetchingData({@required this.category});

  @override
  List<Object> get props => [category];
}

class ChangeCategory extends MoviesEvent {
  final String category;

  ChangeCategory({@required this.category});

  @override
  List<Object> get props => [category];
}

class ChangePageNumber extends MoviesEvent {
  final String category;
  final int pageNumber;

  ChangePageNumber({
    @required this.category,
    this.pageNumber,
  });

  @override
  List<Object> get props => [category];
}
