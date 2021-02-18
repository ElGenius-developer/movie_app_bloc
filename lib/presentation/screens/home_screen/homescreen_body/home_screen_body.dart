import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/homescreen_body/trending_text_and_arrows.dart';

import 'movie_card.dart';
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
                    child: TrendingTextAndArrows(),
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
            itemExtent: 435,//change this to media queryy
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
