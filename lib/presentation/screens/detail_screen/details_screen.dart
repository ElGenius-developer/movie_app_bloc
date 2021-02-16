import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/search_bloc/search_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/trending_bloc/trending_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/screens/detail_screen/cast_avatars.dart';
import 'package:movies_app_with_BLoC/presentation/screens/detail_screen/row_of_custom_icons/icons_row.dart';

import 'custom_appbar/Alternative_AppBar_create.dart';
import 'row_of_image_and_title.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  final int index;
  final CachedNetworkImageProvider poster, cover;
  final String tag;
  Movies _movies;

  DetailScreen({
    this.index,
    this.poster,
    this.cover,
    this.tag,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (tag.contains("search"))
      _movies = SearchBloc.searchMovies;
    else if (tag.contains("body"))
      _movies = MoviesBloc.movies;
    else if (tag.contains("trend")) _movies = TrendingBloc.trendingMovies;
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: SafeArea(
        child: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
          return Stack(children: [
            Container(
              color: Color(0xff1B223F),
              child: Column(
                children: [
                  //cover
                  Hero(
                    tag: tag,
                    child: Container(
                        width: size.width,
                        height: size.height / 2.6,
                        child: Image(
                            alignment: Alignment.topCenter,
                            fit: BoxFit.fitHeight,
                            filterQuality: FilterQuality.high,
                            image: cover)),
                  ),
                  Expanded(
                    /////////////////////////////
                    /////////////////////////////
                    ///body after the cover//////
                    /////////////////////////////
                    /////////////////////////////
                    child: SingleChildScrollView(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          /////////////////////////////
                          /////////////////////////////
                          //////first row//////////////
                          /////////////////////////////
                          /////////////////////////////
                          RowImageAndTitle(
                            index: index,
                            imageProvider: poster,
                            movies: _movies,
                          ),

                          /////////////////////////////
                          /////////////////////////////
                          //////second row/////////////
                          /////////////////////////////
                          /////////////////////////////
                          CastAvatars(
                            imageProvider: poster,
                            index: index,
                          ),
                          IconsRow(
                            index: index,
                            movies: _movies,
                          ),
                          /////////////////////////////
                          /////////////////////////////
                          //////Movie Overview/////////
                          /////////////////////////////
                          /////////////////////////////
                          Container(
                            padding: EdgeInsets.all(15),
                            child: Text(_movies.results[index].overview ?? ""),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /////////////////////////////
            /////////////////////////////
            //////Like Button////////////
            /////////////////////////////
            /////////////////////////////
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment(.9, -.242),
                child: Container(
                    width: size.width / 6.5,
                    height: size.height / 13.1,
                    decoration: BoxDecoration(
                        color: Colors.red.shade700, shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.heart,
                        size: 30,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
            //App bar
            CustomAppBar(
              movie:_movies.results[index],
              index: index,
            ),
          ]);
        }),
      ),
    );
  }
}