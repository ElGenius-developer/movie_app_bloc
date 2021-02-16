import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/cast_bloc/cast_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/routers/router_arguments.dart';

import '../../../data/models/movies_model/moviesAPI.dart';
import '../../../presentation/screens/detail_screen/row_of_image_and_title.dart';

class SearchMoviesCard extends StatelessWidget {
  final int length;
  final Movies searchMovies;
  const SearchMoviesCard(
      {Key key, @required this.length, @required this.searchMovies})
      : super(
    key: key,
  );
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        width: size.width - 35,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: length ?? 0,
            itemBuilder: (context, index) {
              var poster = CachedNetworkImageProvider(
                searchMovies.results[index].posterPath,
              );
              var cover = CachedNetworkImageProvider(
                searchMovies.results[index].backdropPath,
              );
              return Card(
                color: Colors.transparent,
                child: GestureDetector(
                    child: Hero(
                      tag:"search:$index" ,
                      child: RowImageAndTitle(
                        index: index,
                        imageProvider: poster,
                        movies: searchMovies,
                      ),
                    ),
                    onTap: () {

                      BlocProvider.of<CastBloc>(context)
                        ..add(FetchingCast(searchMovies.results[index].id));
                      Navigator.of(context).pushNamed( "/detailScreen",
                          arguments: ScreenArguments(
                              index, poster, cover, "search:$index"));
                    }),
              );
            }),
      ),
    );
  }
}
