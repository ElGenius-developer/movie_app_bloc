import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/presentation/routers/router_arguments.dart';
import 'package:movies_app_with_BLoC/presentation/screens/detail_screen/details_screen.dart';
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
        return MaterialPageRoute(
          builder: (context) => DetailScreen(
            poster: args.poster,
            index: args.index,
            cover: args.cover,
          ),
        );
        break;
      case "/searchScreen":
        return MaterialPageRoute(
          builder: (context) => SearchScreen(),
        );
        break;
      default:
        return null;
        break;
    }
  }
}
