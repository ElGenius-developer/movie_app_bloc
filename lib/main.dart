import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/cast_bloc/cast_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/links_bloc/links_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/routers/app_router.dart';

import 'logic/cubits/Internet_cubit/internet_cubit.dart';

void main() {
  final connectivity = Connectivity();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<InternetCubit>(
      create: (context) => InternetCubit(connectivity: connectivity),
    ),
    BlocProvider<MoviesBloc>(
      create: (context) => MoviesBloc()
        ..add(FetchingData(category: StaticData().categoriesList.first)),
    ),
    BlocProvider<LinksBloc>(
      create: (context) => LinksBloc(),
    ),
    BlocProvider<CastBloc>(
      create: (context) => CastBloc(),
    ),
  ], child: MovieApp()));
}

// ignore: must_be_immutable
class MovieApp extends StatelessWidget {
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      theme: StaticData().lightThemData,
      darkTheme: StaticData().darkThemeData,
      themeMode: ThemeMode.dark,
      /*false?
      ThemeMode.light:ThemeMode.dark,*/
      onGenerateRoute: appRouter.onGeneratedRoute,
    );
  }
}
