import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/presentation/routers/router_arguments.dart';
import 'package:movies_app_with_BLoC/presentation/screens/detail_screen/details_screen.dart';
import 'package:movies_app_with_BLoC/presentation/screens/favourite_list_screen/favourite_list.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/home_screen.dart';
import 'package:movies_app_with_BLoC/presentation/screens/search_screen/search_screen.dart';


class AppRouter {
  Route onGeneratedRoute(RouteSettings routeSettings) {
    final ScreenArguments args = routeSettings.arguments;

    switch (routeSettings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
        break;
      case "/detailScreen":
        return CupertinoPageRoute(
          builder: (context) => DetailScreen(
            index: args.index,
            tag: args.tag,
          ),
        );
        break;
      case "/searchScreen":
        return CupertinoPageRoute(
          builder: (context) => SearchScreen(),
        );
        break;
      case "/favourites":
        return CupertinoPageRoute(
          builder: (context) => FavouriteList(),
        );
        break;
      default:
        return null;
        break;
    }
  }
}
