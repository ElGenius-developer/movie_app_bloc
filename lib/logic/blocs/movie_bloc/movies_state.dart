part of 'movies_bloc.dart';

//Equatable is used to ensure that two instance are fully equal to each other
abstract class MoviesState {
  const MoviesState();
}

class InitialState extends MoviesState {
}

class LoadingState extends MoviesState {
}

class ErrorState extends MoviesState {
  final String errorMessage;

  ErrorState({@required this.errorMessage});


}

class SuccessState extends MoviesState {
  final Movies movies;
  final List<Cast> cast;

  SuccessState({this.movies, this.cast});


}
