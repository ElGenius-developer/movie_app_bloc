import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';

abstract class MoviesRepositoryData {
  Future<Movies> getData({String category});

  Future<Movies> getTrendingMovies();
}
