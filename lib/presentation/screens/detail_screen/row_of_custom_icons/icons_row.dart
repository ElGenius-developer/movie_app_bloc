import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/movies_details.dart';
import 'package:movies_app_with_BLoC/presentation/screens/detail_screen/row_of_custom_icons/youtube_button.dart';

import 'custom_icons.dart';

class IconsRow extends StatelessWidget {
  final int index;
  final List<MoviesDetails> resultsMovies;

  const IconsRow({Key key, this.index, this.resultsMovies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: ),
      width: StaticData.size.width - 5,
      height: StaticData.size.height / 8,
      child: Card(
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              YouTubeButton(
                movieId: resultsMovies[index].id,
              ),
              CustomizedIcons(
                  icon1: CupertinoIcons.hexagon,
                  icon2: CupertinoIcons.hexagon_fill,
                  innerText: "${resultsMovies[index].voteAverage}",
                  underlineText: "${resultsMovies[index].voteCount} votes"),
              CustomizedIcons(
                  innerText: "${resultsMovies[index].popularity.round()}",
                  underlineText: "popularity"),
              CustomizedIcons(
                  innerText: "${resultsMovies[index].originalLanguage}",
                  underlineText: "Languages"),
            ],
          ),
        ),
      ),
    );
  }
}
