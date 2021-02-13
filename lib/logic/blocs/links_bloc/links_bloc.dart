import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app_with_BLoC/data/Repository/trailers/trailers_repository.dart';

part 'links_event.dart';
part 'links_state.dart';

class LinksBloc extends Bloc<LinksEvent, LinksState> {
  var _trailersRep = TrailersRepository();
  var _movieKey = '';

  LinksBloc() : super(LinksInitial());

  @override
  Stream<LinksState> mapEventToState(
    LinksEvent event,
  ) async* {
    if (event is LaunchTrailer) {
      // yield LinksInitial();

      try {
        await _trailersRep.getVideoUrl(event.movieID).then((value) {
          _movieKey = value.key;
        });
        _trailersRep.launchYoutube(movieKey: _movieKey);
        yield SuccessLaunching();
      } catch (e) {
        yield ErrorLaunching(errorMessage: e.toString());
      }
    } else if (event is ShareMovie) {
      try {
        await _trailersRep.getVideoUrl(event.movieID).then((value) {
          _movieKey = value.key;
        });
        _trailersRep.share(
          movieKey: _movieKey,
          index: event.index,
          context: event.context,
        );
        yield SuccessLaunching();
      } catch (e) {
        yield ErrorLaunching(errorMessage: e.toString());
      }
    }
  }
}
