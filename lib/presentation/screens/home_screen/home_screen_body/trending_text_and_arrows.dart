import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';

// ignore: must_be_immutable
class TrendingTextAndArrows extends StatelessWidget {
  Widget iconArrow(bool isIncrease, BuildContext context) {
    return IconButton(
        tooltip: isIncrease ? "next" : "back",
        icon: Icon(
          isIncrease
              ? CupertinoIcons.chevron_right_circle
              : CupertinoIcons.chevron_left_circle,
          color: Colors.redAccent.shade700,
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
    return Container(
      width: StaticData.size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Text(
                  "Trending",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: StaticData.size.width / 22,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(color: Colors.white, blurRadius: 1),
                        Shadow(color: Colors.red.shade900, blurRadius: 1.2),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              iconArrow(false, context),
              Container(
                width: StaticData.size.width / 8,
                height: StaticData.size.height / 13,
                alignment: Alignment.center,
                child: Text(
                  "${context.watch<MoviesBloc>().pageNumber}",
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Theme.of(context).textTheme.overline.color,
                      fontStyle: FontStyle.italic,
                      shadows: [
                        Shadow(
                            color: Colors.red.shade900,
                            offset: Offset(-1, 1),
                            blurRadius: 10)
                      ]),
                ),
              ),
              iconArrow(true, context),
            ],
          ),
        ],
      ),
    );
  }
}
