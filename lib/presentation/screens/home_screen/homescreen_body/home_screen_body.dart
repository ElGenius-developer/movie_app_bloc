import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'file:///C:/Users/ah_as/AndroidStudioProjects/movies_app_with_BLoC/lib/presentation/screens/home_screen/homescreen_body/movie_card.dart';
import 'trending_movies_card.dart';

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final movies = MoviesBloc.movies;
    return CustomScrollView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(

            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            // floating: true,
            expandedHeight: MediaQuery.of(context).size.height / 3.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
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
                                    color: Colors.white12,
                                    offset: Offset(.2, .2))
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
                    key: ValueKey("Trending"),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 435,
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Card(
                        child: MovieCard(
                      index: index,
                      movies: movies,
                    )),
                childCount: movies.results.length ?? 0,
                addRepaintBoundaries: true),
          ),
        ]);
  }
}
