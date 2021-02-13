part of 'movies_bloc.dart';

//Equatable is used to ensure that two instance are fully equal to each other
abstract class MoviesState extends Equatable {
  const MoviesState();
}

class InitialState extends MoviesState {
  @override
  List<Object> get props => [];
}

class LoadingState extends MoviesState {
  @override
  List<Object> get props => [];
}

class ErrorState extends MoviesState {
  final String errorMessage;

  ErrorState({@required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class SuccessState extends MoviesState {
  final Movies movies;
  final List<Cast> cast;

  SuccessState({this.movies, this.cast});

  @override
  List<Object> get props => [movies];
}
