import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../presentation/routers/router_arguments.dart';
import '../../presentation/screens/detail_screen/details_screen.dart';
import '../../presentation/screens/home_screen/home_screen.dart';
import '../../presentation/screens/search_screen/search_screen.dart';

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
      default:
        return null;
        break;
    }
  }
}
