import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/movies_details.dart';
import 'package:movies_app_with_BLoC/logic/blocs/links_bloc/links_bloc.dart';

// back and share row with shadow
class CustomAppBar extends StatelessWidget {
  final MoviesDetails movie;
  @required
  final int index;

  const CustomAppBar({Key key, @required this.movie, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: IconShadowWidget(
              Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: StaticData.size.width/15,
              ),
              shadowColor: Colors.black,
              showShadow: true,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: IconShadowWidget(
              Icon(
                Icons.share,
                color: Colors.white,
                size: StaticData.size.width/15,
              ),
              shadowColor: Colors.black,
              showShadow: true,
            ),
            onPressed: () {
              context.read<LinksBloc>().add(ShareMovie(
                  index: index,
                  context: context,
                  movieID: movie.id,
                  movieName: movie.title));
            },
          ),
        ],
      ),
    );
  }
}
