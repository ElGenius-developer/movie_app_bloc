import 'dart:async';
import 'package:hive/hive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/movies_details.dart';

part 'like_event.dart';

part 'like_state.dart';

class LikeBloc extends Bloc<LikeEvent, LikeState> {
  LikeBloc() : super(LikeInitial());
  Box<MoviesDetails> box;

  @override
  Stream<LikeState> mapEventToState(
    LikeEvent event,
  ) async* {
    if (event is AddMovieToLikes) {
      addToDatabase(event.movie);

      yield LikeAdded();
    } else if (event is RemoveMovieFromLikes) {
      deleteFromDatabase(event.movie.id.toString());
      yield LikeRemoved();
    }
  }

  void addToDatabase(MoviesDetails movie) async {
    // box = Hive.box<MoviesDetails>('savedList');
    try {
      await box.put('${movie.id}', movie);
    } catch (e) {
      print(e.toString());
    }

  }

  void deleteFromDatabase(String movieId) async {
    box.delete(movieId);
    box.values.forEach((value) {
      print(value.title);
    });
  }

  @override
  Future<Function> close() {
    box.close();
    Hive.close();
    return super.close();
  }

  @override
  void onTransition(Transition<LikeEvent, LikeState> transition) {
    print(transition.currentState);
    super.onTransition(transition);
  }
}
