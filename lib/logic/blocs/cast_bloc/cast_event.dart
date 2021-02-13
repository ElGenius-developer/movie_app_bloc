part of 'cast_bloc.dart';

abstract class CastEvent extends Equatable {
  const CastEvent();
}

class FetchingCast extends CastEvent {
  @required
  final int movieID;

  FetchingCast(this.movieID);

  @override
  List<Object> get props => [];
}
