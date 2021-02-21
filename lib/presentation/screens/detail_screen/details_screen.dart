import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/movies_details.dart';
import 'package:movies_app_with_BLoC/logic/blocs/like_bloc/like_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/screens/detail_screen/like_button/LikeButton_screen.dart';
import '../../../logic/blocs/movie_bloc/movies_bloc.dart';
import '../../../logic/blocs/search_bloc/search_bloc.dart';
import '../../../logic/blocs/trending_bloc/trending_bloc.dart';
import '../../../presentation/screens/detail_screen/cast_avatars.dart';
import '../../../presentation/screens/detail_screen/row_of_custom_icons/icons_row.dart';
import '../../../presentation/widgets/my_cached_image_network.dart';
import 'custom_appbar/Alternative_AppBar_create.dart';
import 'row_of_image_and_title.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final int index;
  final String tag;
  List<MoviesDetails> _movies;

  DetailScreen({
    this.index,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (tag.contains("search"))
      _movies = SearchBloc.searchMovies.results;
    else if (tag.contains("body"))
      _movies = MoviesBloc.movies.results;
    else if (tag.contains("trend")) _movies = TrendingBloc.trendingMovies.results;
    else _movies= context.read<LikeBloc>().box.values.toList();
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: SafeArea(
        child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
          return Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CustomScrollView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: MediaQuery.of(context).size.height / 2.5,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                      children: [
                        Hero(
                          tag: tag,
                          child: Container(
                              width: size.width,
                              height: size.height / 2.6,
                              child: MyCachedImageNetwork(
                                boxFit: BoxFit.cover,
                                url: _movies[index].backdropPath,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Align(
                            alignment: Alignment(1, 0.85),
                            child: Container(
                              width: size.width / 6.5,
                              height: size.height / 13.1,
                              decoration: BoxDecoration(
                                  color: Colors.red.shade900,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.white12,
                                        offset: Offset(.5, .5),
                                        blurRadius: 5,
                                        spreadRadius: 2),
                                    BoxShadow(
                                        color: Colors.white12,
                                        offset: Offset(-.5, .5),
                                        blurRadius: 5,
                                        spreadRadius: 2),
                                    BoxShadow(
                                        color: Colors.white12,
                                        offset: Offset(.5, -.5),
                                        blurRadius: 2,
                                        spreadRadius: 2),
                                    BoxShadow(
                                        color: Colors.black54,
                                        offset: Offset(-.5, -.5),
                                        blurRadius: .5,
                                        spreadRadius: 2),
                                  ],
                                  shape: BoxShape.circle),
                              child: LikeButton(movie: _movies[index]),
                            ),
                          ),
                        ),
                        //App bar
                        CustomAppBar(
                          movie: _movies[index],
                          index: index,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 2),
                      child: RowImageAndTitle(
                        index: index,
                        movies: _movies,
                      ),
                    ),
                    CastAvatars(
                      index: index,
                    ),
                    IconsRow(
                      index: index,
                      resultsMovies: _movies,
                    ),
                    Card(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Text(

                          _movies[index].overview ?? "",
                          textAlign: TextAlign.justify,
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                              height: 1.5,
                              fontSize: 15,
                              wordSpacing: -1,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
