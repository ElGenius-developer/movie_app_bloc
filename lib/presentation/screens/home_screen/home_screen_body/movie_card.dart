import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
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
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: GestureDetector(
          child: Column(children: [
            Hero(
              tag: "body:$index",
              child: Container(
                width: StaticData.size.width / 1.4 /*248*/,
                height: StaticData.size.height / 1.7,
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
              width: StaticData.size.width * .7,
              height: StaticData.size.height / 14,
              child: Text(
                movies.results[index].title,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: StaticData.size.width / 24.2, shadows: [
                  Shadow(color: Colors.red.shade900, blurRadius: 6),
                ]),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          onTap: () {
            BlocProvider.of<CastBloc>(context)
                .add(FetchingCast(MoviesBloc.movies.results[index].id));
            Navigator.pushNamed(context, "/detailScreen",
                arguments: ScreenArguments(index, "body:$index"));
          }),
    );
  }
}
