import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/custom_circular_indicator.dart';

import 'homescreen_body/home_screen_body.dart';
import 'navigation_bar.dart';
/*
import '../home_screen/homescreen_body/home_screen_body.dart';
import '../../../data/constants/static_data.dart';
import '../../../logic/blocs/movie_bloc/movies_bloc.dart';
import '../../screens/home_screen/navigation_bar.dart';
import '../../widgets/custom_circular_indicator.dart';
*/

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StaticData()
            .categoriesNames[context.watch<MoviesBloc>().categoryNumber]),
        actions: [
          IconButton(
            tooltip: "favourite",
            onPressed: () {
              Navigator.pushNamed(context, "/favourites");
            },
            icon: IconShadowWidget(
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              shadowColor: Colors.black54,
            ),
          ),
          IconButton(
            tooltip: "search",
            onPressed: () {
              Navigator.pushNamed(context, "/searchScreen");
            },
            icon: IconShadowWidget(
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              shadowColor: Colors.black54,
            ),
          )
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        if (state is LoadingState) {
          return Center(
            child: CustomCircularIndicator(
              progress: .3,
            ),
          );
        } else if (state is SuccessState) {
          return HomeScreenBody();
        } else {
          return Center(
            child: Text("Sorry We faced some errors"),
          );
        }
      }),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
