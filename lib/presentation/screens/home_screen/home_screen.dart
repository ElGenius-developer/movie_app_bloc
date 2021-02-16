import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/constants/static_data.dart';
import '../../../logic/blocs/movie_bloc/movies_bloc.dart';
import '../../../logic/cubits/Internet_cubit/internet_cubit.dart';
import '../../screens/home_screen/movie_card.dart';
import '../../screens/home_screen/navigation_bar.dart';
import '../../widgets/custom_circular_indicator.dart';
import 'trending_movies_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var internet = BlocProvider.of<InternetCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(StaticData()
            .categoriesNames[context.watch<MoviesBloc>().categoryNumber]),
        actions: [
          IconButton(
            onPressed: () {
                Navigator.pushNamed(context,"/searchScreen");
             },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        if (internet.state is InternetDisconnected) {
          BotToast.showText(
              duration: Duration(seconds: 2),
              text: ("Error Loading Trending movies"));
          BotToast.showSimpleNotification(
              title: "Error Loading Trending movies",
              duration: Duration(seconds: 2));
          return Center(
            child: Text("You are offline"),
          );
        } else {
          if (state is LoadingState) {
            return Center(
              child: CustomCircularIndicator(
                progress: .3,
              ),
            );
          } else if (state is SuccessState) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        "Trending",
                        style: Theme.of(context).textTheme.headline6.copyWith(
                            fontSize: 17.8,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  color: Colors.deepOrange,
                                  offset: Offset(-.2, -.2)),
                              Shadow(
                                  color: Colors.white12, offset: Offset(.2, .2))
                            ]),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        StaticData().iconsList[0].icon,
                        color: Colors.deepOrange,
                      )
                    ],
                  ),
                  height: 40,
                ),
                TrendingMoviesContainer(
                  state: state,
                ),
                Expanded(
                  child: MovieCard(
                    movies: state.movies,
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text("Sorry We faced some errors"),
            );
          }
        }
      }),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
