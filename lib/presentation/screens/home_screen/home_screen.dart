import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';
import 'package:movies_app_with_BLoC/logic/cubits/Internet_cubit/internet_cubit.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/movie_card.dart';
import 'package:movies_app_with_BLoC/presentation/screens/home_screen/navigation_bar.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/custom_circular_indecator.dart';

class HomeScreen extends StatelessWidget {
  _showSnackBar(String text, BuildContext context) {
    return Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        content: Text(text),
        duration: Duration(seconds: 5),
      ));
  }

  @override
  Widget build(BuildContext context) {
    final internet = BlocProvider.of<InternetCubit>(context);
    // print(internet.state);
    return Scaffold(
      appBar: AppBar(
        title: Text(StaticData()
            .categoriesNames[context.watch<MoviesBloc>().categoryNumber]),
      ),
      body: BlocBuilder<MoviesBloc, MoviesState>(builder: (context, state) {
        if (internet.state is InternetDisconnected) {
          _showSnackBar("no Internet", context);
          return Center(
            child: Text("You are offline"),
          );
        } else {
          if (state is LoadingState) {
            return Center(
              child: CustomCircularIndicator(
                progress: .3,
              ),
            );
          } else if (state is SuccessState) {
            return MovieCard(
              movies: state.movies,
            );
          } else {
            return Center(
              child: Text("Sorry We faced some errors"),
            );
          }
        }
      }),
      bottomNavigationBar: NavigationBar(),
    );
  }
}
