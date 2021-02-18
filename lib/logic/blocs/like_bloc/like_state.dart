part of 'like_bloc.dart';

abstract class LikeState {
  const LikeState();
}

class LikeInitial extends LikeState {}

class LikeAdded extends LikeState {}

class LikeRemoved extends LikeState {}
