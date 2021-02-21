import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_shadow/icon_shadow.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';

class NavigationBar extends StatelessWidget {
  final _constants = StaticData();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) => BottomNavigationBar(
        elevation: 15,
        showSelectedLabels: true,
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.red[600],
        currentIndex: BlocProvider.of<MoviesBloc>(context).categoryNumber,
        onTap: (value) {
          BlocProvider.of<MoviesBloc>(context).categoryNumber = value;
          BlocProvider.of<MoviesBloc>(context)
            ..add(ChangeCategory(
              category: _constants.categoriesList[value],
            ));
        },
        items: List.generate(
          _constants.categoriesNames.length,
          (index) => BottomNavigationBarItem(
              label: _constants.categoriesNames[index],
              // backgroundColor: Color(0xff1B222F),
              //0xff1B212F//gray blue
              icon: IconShadowWidget(_constants.iconsList[index],
                  shadowColor: Colors.red[900])),
          growable: true,
        ),
      ),
    );
  }
}
