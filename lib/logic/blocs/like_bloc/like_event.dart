part of 'like_bloc.dart';

abstract class LikeEvent {}

class LikeInitialEvent extends LikeEvent {}

class FetchLikedList extends LikeEvent {
  final MoviesDetails movie;

  FetchLikedList(this.movie);
}

class AddMovieToLikes extends LikeEvent {
  final MoviesDetails movie;

  AddMovieToLikes(this.movie);
}

class RemoveMovieFromLikes extends LikeEvent {
  final MoviesDetails movie;

  RemoveMovieFromLikes(this.movie);
}
