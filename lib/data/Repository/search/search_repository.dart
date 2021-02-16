import 'package:dio/dio.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';

class SearchRepository {
  final _constants = StaticData();

  Future<Movies> getSearchMovies({String query, int page}) async {
    String url = (_constants.baseUrl + "search/movie");
    var parameters = {
      'api_key': _constants.apiKey,
      'query': query,
      'language': 'en-US',
      'page': page ?? 1,};
    var _movies = Movies();
    try {
      final res = await Dio().get(
        url, queryParameters: parameters,);
      _movies = Movies.fromJson(res.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      _movies = Movies.withError(error);
    }
    return _movies;
  }
}
