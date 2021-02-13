import 'package:dio/dio.dart';
import 'package:movies_app_with_BLoC/data/Repository/movies/movies_repository_data.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';

class MoviesRepository extends MoviesRepositoryData {
  // static data is class has all fixed data to use inside the app
  final _constants = StaticData();
  Movies movies;

  @override
  Future<Movies> getData({String category, pageNumber}) async {
    String url = (_constants.baseUrl + category);
    // '&language=en-us&page=$currentValue'

    /*$currentValue*/

    var parameters = {
      'api_key': _constants.apiKey,
      'language': "en-US",
      'page': 1 /*(pageNumber == null) ? 1 : pageNumber,*/
    };

    final res = await Dio().get(url, queryParameters: parameters);

    if (res.statusCode == 200) {
      movies = Movies.fromJson(res.data);
    } else {
      throw Exception("Failed to load data"); //change it to error in block

    }

    return movies;
  }
}
