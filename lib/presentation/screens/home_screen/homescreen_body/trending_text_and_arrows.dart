import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';

// ignore: must_be_immutable
class TrendingTextAndArrows extends StatelessWidget {
  Widget iconArrow(bool isIncrease, BuildContext context) {
    return IconButton(
        tooltip: isIncrease ? "next" : "back",
        icon: isIncrease
            ? Icon(
                Icons.arrow_back_ios,
                textDirection: TextDirection.rtl,
                color: Colors.redAccent,
              )
            : Icon(
                Icons.arrow_back_ios,
                color: Colors.redAccent,
              ),
        onPressed: () {
          int index, pageNumber;

          if (isIncrease) {
            index = BlocProvider.of<MoviesBloc>(context).categoryNumber;
            pageNumber = BlocProvider.of<MoviesBloc>(context).pageNumber + 1;
          } else {
            index = BlocProvider.of<MoviesBloc>(context).categoryNumber;
            pageNumber = BlocProvider.of<MoviesBloc>(context).pageNumber - 1;
          }
          BlocProvider.of<MoviesBloc>(context)
            ..add(ChangePageNumber(
                category: StaticData().categoriesList[index],
                pageNumber: pageNumber));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 14,
          child: Row(
            children: [
              Text(
                "Trending",
                style: Theme.of(context).textTheme.headline6.copyWith(
                    fontSize: 17.8,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.deepOrange, offset: Offset(-.2, -.2)),
                      Shadow(color: Colors.white12, offset: Offset(.2, .2))
                    ]),
              ),
              SizedBox(
                width: 10,
              ),
              Icon(
                StaticData().iconsList[0].icon,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
        Flexible(
          flex: 9,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconArrow(false, context),
              Card(
                child: Text(
                  "${context.watch<MoviesBloc>().pageNumber}",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.red, blurRadius: 10)]),
                ),
              ),
              iconArrow(true, context),
            ],
          ),
        ),
      ],
    );
  }
}
