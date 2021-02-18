import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/movies_model/moviesAPI.dart';
import '../../../logic/blocs/cast_bloc/cast_bloc.dart';
import '../../../presentation/routers/router_arguments.dart';
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
              return Card(
                color: Colors.transparent,
                child: GestureDetector(
                    child: Hero(
                      tag: "search:$index",
                      child: RowImageAndTitle(
                        index: index,
                        movies: searchMovies.results,
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      BlocProvider.of<CastBloc>(context)
                        ..add(FetchingCast(searchMovies.results[index].id));
                      Navigator.of(context).pushNamed("/detailScreen",
                          arguments: ScreenArguments(index, "search:$index"));
                    }),
              );
            }),
      ),
    );
  }
}
