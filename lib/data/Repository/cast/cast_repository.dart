import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/credits_model/credits.dart';

class CastRepository {
  final _constants = StaticData();

  Future<Credits> getData({int movieID}) async {
    Credits _credits;
    String url = (_constants.baseUrl + "movie/$movieID" + '/credits');

    var parameters = {
      'api_key': _constants.apiKey,
      'language': "en-US",
    };

    try {
      final res = await Dio().get(url, queryParameters: parameters);

      _credits = Credits.fromJson(res.data);
      if (_credits == null) _credits = Credits.withError("error");
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      _credits = Credits.withError(error);
    }

    return _credits;
  }
}
