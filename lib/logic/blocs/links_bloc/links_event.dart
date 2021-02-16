part of 'links_bloc.dart';

abstract class LinksEvent extends Equatable {
  const LinksEvent();
}

class LaunchTrailer extends LinksEvent {
  final int movieID;

  LaunchTrailer({@required this.movieID});

  @override
  List<Object> get props => [movieID];
}

class ShareMovie extends LinksEvent {
  final int movieID;
  final int index;
  final String movieName;
  final BuildContext context;

  ShareMovie(
      {@required this.movieName,
        @required this.index, @required this.context, @required this.movieID});

  List<Object> get props => [movieID];
}
