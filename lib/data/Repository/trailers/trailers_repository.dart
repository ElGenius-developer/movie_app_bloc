import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/trailers_model/trailersAPI.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class TrailersRepository {
  var _constants = StaticData();
  var _trailers = Trailers();

  Future<TrailersResults> getVideoUrl(int movieID) async {
    var parameters = {
      'api_key': _constants.apiKey,
      'movie_id': movieID,
      'language': 'en-US',
    };
    String videoURL = (_constants.baseUrl +
        "movie/$movieID/"
            'videos');

    final res = await Dio().get(videoURL, queryParameters: parameters);
    if (res.statusCode == 200) {
      _trailers = Trailers.fromJson(res.data);
    } else {
      throw Exception("Failed to load data"); //or e
    }

    return _trailers.results[0];
  }

  void launchYoutube({String movieKey}) async {
    if (Platform.isIOS) {
      if (await canLaunch(
          'youtube://${_constants.baseYoutubeUrl}' + movieKey)) {
        await launch('youtube://${_constants.baseYoutubeUrl}' + movieKey,
            forceSafariVC: false);
      } else {
        throw 'Could not launch ${_constants.baseYoutubeUrl}' + movieKey;
      }
    } else {
      var url = '${_constants.baseYoutubeUrl}' + movieKey;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  Future share(
      {BuildContext context,
      int index,
      String movieKey,
      String movieName}) async {
    final RenderBox box = context.findRenderObject();
    Share.share('${StaticData().baseYoutubeUrl}' + '$movieKey',
        subject: movieName,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
