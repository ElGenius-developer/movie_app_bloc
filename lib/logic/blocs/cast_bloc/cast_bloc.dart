import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app_with_BLoC/data/Repository/cast/cast_repository.dart';
import 'package:movies_app_with_BLoC/data/models/credits_model/credits.dart';

part 'cast_event.dart';
part 'cast_state.dart';

class CastBloc extends Bloc<CastEvent, CastState> {
  var credits = Credits();
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
        yield SuccessLoadCast(credits);
      } catch (error) {
        yield ErrorLoadCast(error);
      }
    }
  }
}
