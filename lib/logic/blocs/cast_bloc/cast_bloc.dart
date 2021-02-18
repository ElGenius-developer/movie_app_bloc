import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app_with_BLoC/data/Repository/cast/cast_repository.dart';
import 'package:movies_app_with_BLoC/data/models/credits_model/credits.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  static Credits credits = Credits();
  var _castRepo = CastRepository();

  CastBloc() : super(CastInitial());

  @override
  Stream<CastState> mapEventToState(
    CastEvent event,
  ) async* {
    if (event is FetchingCast) {
      yield LoadingCast();
      try {
        credits = await _castRepo.getData(movieID: event.movieID);
        if (credits.cast == null)
          yield ErrorLoadCast("failed to load");
        else
          yield SuccessLoadCast(credits);
      } catch (error) {
        yield ErrorLoadCast(error);
      }
    }
  }
}
