import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/moviesAPI.dart';
import 'package:movies_app_with_BLoC/logic/blocs/cast_bloc/cast_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/routers/router_arguments.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/my_cached_image_network.dart';

class MovieCard extends StatelessWidget {
  final Movies movies;
  final int index;

  const MovieCard({Key key, @required this.movies, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
          child: Column(children: [
            Hero(
              tag: "body:$index",
              child: Container(
                width: width / 1.35 /*248*/,
                height: height / 2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.red[900], width: 5)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: MyCachedImageNetwork(
                      url: movies.results[index].posterPath,
                      boxFit: BoxFit.cover,
                    )),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: width * .716,
              height: height / 16,
              // color: Colors.black.withAlpha(160),
              child: Text(
                movies.results[index].title,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 17, shadows: [
                  Shadow(color: Colors.red, offset: Offset(-.4, -.3)),
                  Shadow(color: Colors.red, offset: Offset(.4, .3)),
                  Shadow(color: Colors.red, offset: Offset(.4, -.3)),
                  Shadow(color: Colors.red, offset: Offset(-.4, .3))
                ]),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          onTap: () {
            BlocProvider.of<CastBloc>(context)
                .add(FetchingCast(MoviesBloc.movies.results[index].id));
            /*  BlocProvider.of<LikeBloc>(context)
                .add(FetchLikedList(movies.results[index]));*/

            Navigator.pushNamed(context, "/detailScreen",
                arguments: ScreenArguments(index, "body:$index"));
          }),
    );
  }
}
