import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';
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
      width: MediaQuery.of(context).size.width - 5,
      height: MediaQuery.of(context).size.height / 8,
      child: Card(
        child: FittedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              YouTubeButton(
                movieId: resultsMovies[index].id,
              ),
              CustomizedIcons(
                  size1: 34.2,
                  size2: 25.162,
                  icon1: CupertinoIcons.hexagon,
                  icon2: CupertinoIcons.hexagon_fill,
                  innerText: "${resultsMovies[index].voteAverage}",
                  underlineText: "${resultsMovies[index].voteCount} votes"),
              CustomizedIcons(
                  size1: 34.2,
                  size2: 27.28,
                  innerText: "${resultsMovies[index].popularity.round()}",
                  underlineText: "popularity"),
              CustomizedIcons(
                  size1: 34.19,
                  size2: 27.28,
                  innerText: "${resultsMovies[index].originalLanguage}",
                  underlineText: "Languages"),
            ],
          ),
        ),
      ),
    );
  }
}
