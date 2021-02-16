import 'package:dio/dio.dart';
import 'package:movies_app_with_BLoC/data/Repository/movies/movies_repository_data.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';

class MoviesRepository extends MoviesRepositoryData {
  // static data is class has all fixed data to use inside the app
  final _constants = StaticData();
  Movies _movies;

  @override
  Future<Movies> getData({String category, pageNumber}) async {
    String url = (_constants.baseUrl + "movie/$category");

    var parameters = {
      'api_key': _constants.apiKey,
      'language': "en-US",
      'page': 1 /*(pageNumber == null) ? 1 : pageNumber,*/
    };

    final res = await Dio().get(url, queryParameters: parameters);

    if (res.statusCode == 200) {
      _movies = Movies.fromJson(res.data);
    } else {
      throw Exception("Failed to load data"); //change it to error in block

    }

    return _movies;
  }

  @override
  Future<Movies> getTrendingMovies() async {
    {
      String url = (_constants.baseUrl+_constants.trendingURL);

      var parameters = {
        'api_key': _constants.apiKey,
      };

      final res = await Dio().get(url, queryParameters: parameters);

      if (res.statusCode == 200) {
        return Movies.fromJson(res.data);
      } else {
        throw Exception("Failed to load data"); //change it to error in block

      }
    }
  }
}
