import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StaticData {

  static Size size;

  final String imageUrlPrefix =
      'https://image.tmdb.org/t/p/w342'; //the start of the image url

  final String apiKey = '944da4297799bd63a31aa54b2017eb8b';

//you can get your own api key from  https://themoviedb.org/
  final String baseUrl = 'https://api.themoviedb.org/3/';
  final String trendingURL = "trending/movie/week";

  final String baseYoutubeUrl = 'https://www.youtube.com/watch?v=';

  final String noImageUrl =
      'http://www.newdesignfile.com/postpic/2015/02/no-icon-available_68024.png';
  final String noImageUrlCover =
      'https://api.happening.media/uploads/default/default.jpg';

  final categoriesList = ['popular', 'top_rated', 'now_playing', 'upcoming'];
  final categoriesNames = ['Popular', 'Top Rated', 'Now Playing', 'Upcoming'];
  final iconsList = [
    Icon(Icons.local_fire_department_outlined,size: 30, color: Colors.red.shade900),
    Icon(
      Icons.star,size: 30,
      color: Colors.red.shade900,
    ),
    Icon(Icons.play_circle_fill,size: 30, color: Colors.red.shade900),
    Icon(CupertinoIcons.time_solid,size: 30, color: Colors.red.shade900), //Color(0xffFBFCFC)
  ];
////////Dark Theme
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
    shadowColor: Color(0xff1B222F ),

    colorScheme: ColorScheme.dark(),
    textSelectionColor: Colors.white,
  );
////////Light Theme

  ThemeData lightThemData = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Colors.red,
    canvasColor: Color(0xFFE5E8E8),
    scaffoldBackgroundColor: Color(0xffF0F3F4),
    backgroundColor:Color(0xffF0F3F4),
    cardColor: Color(0xffEBF5F5),
    shadowColor: Colors.black38,
    highlightColor: Colors.black54,

   bottomNavigationBarTheme: BottomNavigationBarThemeData(
     // selectedItemColor: Colors.black12,
   selectedItemColor: Colors.black,

   ),
    appBarTheme: AppBarTheme(
      color: Colors.red.shade900,
    ),
    colorScheme: ColorScheme.light(),
    textSelectionColor: Colors.black54,
  );
}
