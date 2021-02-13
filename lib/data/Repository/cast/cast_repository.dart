import 'package:dio/dio.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/credits_model/credits.dart';

class CastRepository {
  final _constants = StaticData();

  Future<Credits> getData({int movieID}) async {
    Credits _credits;
    String url = (_constants.baseUrl + "$movieID" + '/credits');

    var parameters = {
      'api_key': _constants.apiKey,
      'language': "en-US",
    };

    final res = await Dio().get(url, queryParameters: parameters);

    if (res.statusCode == 200) {
      _credits = Credits.fromJson(res.data);
    } else {
      throw Exception("Failed to load data"); //change it to error in block

    }

    return _credits;
  }
}
