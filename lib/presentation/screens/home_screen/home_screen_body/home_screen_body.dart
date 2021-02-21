import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/home_screen_body/trending_text_and_arrows.dart';
import '../../../../logic/blocs/movie_bloc/movies_bloc.dart';
import 'movie_card.dart';
import 'trending_movies_card.dart';

class HomeScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            expandedHeight: StaticData.size.height / 3.3,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: TrendingTextAndArrows(),
                    height: StaticData.size.height / 18,
                    width: StaticData.size.width,
                  ),
                  TrendingMoviesContainer(
                    key: ValueKey("Trending"),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: StaticData.size.height / 1.4,
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Card(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: StaticData.size.aspectRatio * 15),
                      child: MovieCard(
                        index: index,
                        movies: MoviesBloc.movies,
                      ),
                    )),
                childCount: MoviesBloc.movies.results.length ?? 0,
                addRepaintBoundaries: true),
          ),
        ]);
  }
}
