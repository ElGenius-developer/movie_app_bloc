part of 'cast_bloc.dart';

abstract class CastEvent {
  const CastEvent();
}

class FetchingCast extends CastEvent {
  @required
  final int movieID;

  FetchingCast(this.movieID);
}
