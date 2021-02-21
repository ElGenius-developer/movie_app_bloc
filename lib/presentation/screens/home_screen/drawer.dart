
import 'dart:ui';

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/cubits/them_bloc/them_cubit.dart';

class HomeDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print(context.watch<ThemeCubit>().box.values.first);
    return Drawer(
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customText("Switch theme",context),
          SizedBox(height: StaticData.size.height/25,),
          DayNightSwitcher(
            nightBackgroundColor: Colors.black,
            isDarkModeEnabled:context.watch<ThemeCubit>().box.values.first,
            onStateChanged: (isDarkModeEnabled)  {
              if(isDarkModeEnabled){
                context.read<ThemeCubit>().switchThem(ThemeMode.dark);
              }else{
                context.read<ThemeCubit>().switchThem(ThemeMode.light);
              }
            },),
          /* Expanded(
              child: Container(
              padding: EdgeInsets.symmetric(vertical: MoviesBloc.size.height/4),
              child: Text("Email"),),
            )*/
        ],
      ),
    );
  }


  Widget customText(String word,BuildContext context){
    return Text(word,
    style: Theme.of(context).textTheme.headline5.copyWith(
      fontSize: 20,
      fontStyle: FontStyle.italic,
      shadows: [Shadow(
         blurRadius: 5,
      )]
    ),
    );

  }
}
