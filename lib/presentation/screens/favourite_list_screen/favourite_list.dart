import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/cast_bloc/cast_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/like_bloc/like_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/routers/router_arguments.dart';
import 'package:movies_app_with_BLoC/presentation/screens/detail_screen/row_of_image_and_title.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/toast_dialog_method/show_toast_alert.dart';

class FavouriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourite",
          style: Theme.of(context).textTheme.headline6.copyWith(
              fontSize: 20,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 2, color: Colors.black38)]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: context.watch<LikeBloc>().box.values.length ?? 0,
          separatorBuilder: (context, index) => Divider(
            color: Colors.red,
            thickness: .5,
          ),
          itemBuilder: (context, index) => Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GestureDetector(
                  child: RowImageAndTitle(
                    index: index,
                    movies: context.watch<LikeBloc>().box.values.toList(),
                  ),
                  onTap: () {
                    context.read<CastBloc>()
                      ..add(FetchingCast(context
                          .read<LikeBloc>()
                          .box
                          .values
                          .toList()[index]
                          .id));
                    Navigator.pushNamed(context, "/detailScreen",
                        arguments: ScreenArguments(index, "favourite"));
                  }),
              Container(
                padding: EdgeInsets.all(4),
                alignment: Alignment(.9, 0),
                child: IconButton(
                    highlightColor: Theme.of(context).scaffoldBackgroundColor,
                    onPressed: () {

                      final movie =
                          context.read<LikeBloc>().box.values.toList()[index];
                      context.read<LikeBloc>()
                        ..add(RemoveMovieFromLikes(movie));
                      ToastAlertDialog.showAlert(context, "${movie.title} is removed",
                      title: "Remove",
                        alignDouble: .92,
                        icon: Icons.done,
                      );
                    },
                    tooltip: "remove",
                    icon: Icon(
                      Icons.delete_rounded,
                      // color: Colors.grey,
                      size: 40,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
