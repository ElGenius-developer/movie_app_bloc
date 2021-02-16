import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticData {
  final String imageUrlPrefix =
      'https://image.tmdb.org/t/p/w342'; //the start of the image url

  final String apiKey = '944da4297799bd63a31aa54b2017eb8b';

//you can get your own api key from  https://themoviedb.org/
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String trendingURL = "trending/movie/week";

  final String baseYoutubeUrl = 'https://www.youtube.com/watch?v=';

  final String noImageUrl =
      "http://www.aaru.edu.jo/websites/aaru2/wp-content/plugins/learnpress/assets/images/no-image.png?Mobile=1&Source=%2F%5Flayouts%2Fmobile%2Fdispform%2Easpx%3FList%3D78b536db%252De7c7%252D45d9%252Da661%252Ddb2a2aa2fbaf%26View%3D6efc759a%252D0646%252D433c%252Dab6e%252D2f027ffe0799%26RootFolder%3D%252Fwebsites%252Faaru2%252Fwp%252Dcontent%252Fplugins%252Flearnpress%252Fassets%252Fimages%26ID%3D4786%26CurrentPage%3D1";

  final categoriesList = ['popular', 'top_rated', 'now_playing', 'upcoming'];
  final categoriesNames = ['Popular', 'Top Rated', 'Now Playing', 'Upcoming'];
  final iconsList = [
    Icon(Icons.local_fire_department_outlined, color: Colors.red[600]),
    Icon(
      Icons.star,
      color: Colors.red[600],
    ),
    Icon(Icons.play_circle_fill, color: Colors.red[600]),
    Icon(CupertinoIcons.clock, color: Colors.red[600]), //Color(0xffFBFCFC)
  ];

  ThemeData darkThemeData = ThemeData(

    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.red[800],
    cardColor: Color(0xff1B222F),
    // backgroundColor:Color(0xff1B222F) ,
  scaffoldBackgroundColor: Color(0xff1B222F),
    primaryColorDark: Color(0xff1B222F),
    canvasColor: Color(0xff1B222F),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red[800],
    ),
    appBarTheme: AppBarTheme(
      color: Colors.red[900],

    ),
    colorScheme: ColorScheme.dark(),
    textSelectionColor: Colors.white,
  );

  ThemeData lightThemData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.red,
    canvasColor: Color(0xffE5E7E9),
    backgroundColor: Color(0xffE5E7E9),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red[700],
    ),
    appBarTheme: AppBarTheme(
      color: Colors.red[700],

    ),
    colorScheme: ColorScheme.light(),
    textSelectionColor: Colors.black,
  );
}
