import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/constants/static_data.dart';
import 'logic/blocs/cast_bloc/cast_bloc.dart';
import 'logic/blocs/links_bloc/links_bloc.dart';
import 'logic/blocs/movie_bloc/movies_bloc.dart';
import 'logic/blocs/search_bloc/search_bloc.dart';
import 'logic/blocs/trending_bloc/trending_bloc.dart';
import 'logic/cubits/Internet_cubit/internet_cubit.dart';
import 'presentation/routers/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

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
    BlocProvider<TrendingBloc>(
      create: (context) => TrendingBloc()..add(GetTrendingMovies()),
    ),
    BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(),
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
