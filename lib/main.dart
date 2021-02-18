import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/movies_details.dart';
import 'package:movies_app_with_BLoC/logic/blocs/like_bloc/like_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'data/constants/static_data.dart';
import 'logic/blocs/cast_bloc/cast_bloc.dart';
import 'logic/blocs/links_bloc/links_bloc.dart';
import 'logic/blocs/movie_bloc/movies_bloc.dart';
import 'logic/blocs/search_bloc/search_bloc.dart';
import 'logic/blocs/trending_bloc/trending_bloc.dart';
import 'logic/cubits/Internet_cubit/internet_cubit.dart';
import 'presentation/routers/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  var path = await getApplicationDocumentsDirectory();
  Hive
    ..init(path.path)
    ..registerAdapter(MoviesDetailsAdapter());
  await Hive.openBox<MoviesDetails>("savedList");
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
    BlocProvider<LikeBloc>(create: (_) => LikeBloc())
  ], child: MovieApp()));
}

class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  @override
  void initState() {
    BlocProvider.of<LikeBloc>(context).box =
        Hive.box<MoviesDetails>("savedList");
    super.initState();
  }

  @override
  void dispose() {
    Hive.close();
    BlocProvider.of<MoviesBloc>(context).close();
    BlocProvider.of<LinksBloc>(context).close();
    BlocProvider.of<CastBloc>(context).close();
    BlocProvider.of<TrendingBloc>(context).close();
    BlocProvider.of<SearchBloc>(context).close();
    BlocProvider.of<LikeBloc>(context).close();
    super.dispose();
  }

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
