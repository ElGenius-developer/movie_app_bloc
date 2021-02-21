import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'them_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemInitial());
  ThemeMode themeMode=ThemeMode.dark ;
  Box <bool>box ;
  bool isDarkThemEnabled=false;
   void switchThem(ThemeMode newMode ){

    switch(newMode){
      case ThemeMode.system:
         emit(DefaultSystemThemState());
        break;
      case ThemeMode.light:
        isDarkThemEnabled=false;
        emit(LightThemState());
        break;
      case ThemeMode.dark:
        isDarkThemEnabled=true;
        emit(DarkThemState());
        break;
    }
    themeMode = newMode;
    saveTheme();
  }
  void saveTheme() async{
    try {
      await box.put('theme',isDarkThemEnabled );
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<Function> close() {
      Hive.close();
      box.close();
     return super.close();
  }
}
