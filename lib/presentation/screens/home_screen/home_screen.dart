import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/logic/cubits/Internet_cubit/internet_cubit.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/movie_card.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/navigation_bar.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/custom_circular_indecator.dart';

import 'trending_movies_card.dart';
import 'package:toast/toast.dart';
class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var internet = BlocProvider.of<InternetCubit>(context);
    // print(internet.state);
    return Scaffold(
      appBar: AppBar(
        title: Text(StaticData()
            .categoriesNames[context.watch<MoviesBloc>().categoryNumber]),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        if (internet.state is InternetDisconnected) {
          Toast.show("no internet", context,duration: 2);
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
                  height: 42,
                ),

                TrendingMoviesCard(
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
