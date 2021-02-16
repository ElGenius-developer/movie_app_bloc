import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';
import 'package:movies_app_with_BLoC/logic/blocs/cast_bloc/cast_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/routers/router_arguments.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/movie_card_body.dart';

class MovieCard extends StatelessWidget {
  final Movies movies;
  const MovieCard({Key key, this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GridView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: (movies == null) ? 0 : movies.results.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: MediaQuery.of(context).size.aspectRatio * 1.9,
          crossAxisCount: 1,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (context, index) {
          CachedNetworkImageProvider poster, cover;

          poster = CachedNetworkImageProvider(
              movies.results[index].posterPath);
          cover = CachedNetworkImageProvider(
              movies.results[index].backdropPath);

          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
                child: MovieCardBody(
                  height: height,
                  width: width,
                  index: index,
                  movies: movies,
                  poster: poster,
                ),
                onTap: () {
                      BlocProvider.of<CastBloc>(context)
        .add(FetchingCast(MoviesBloc.movies.results[index].id));
                  Navigator.pushNamed(context, "/detailScreen",
                      arguments: ScreenArguments(index, poster, cover,"body:$index"));
                }),
          );
        });
  }
}
