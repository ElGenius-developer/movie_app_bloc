import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/movies_details.dart';
import 'package:movies_app_with_BLoC/logic/blocs/like_bloc/like_bloc.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/heart_icon_widget.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/toast_dialog_method/show_toast_alert.dart';

// ignore: must_be_immutable
class LikeButton extends StatelessWidget {
  final MoviesDetails movie;
  bool isLiked = false;

  LikeButton({Key key, this.movie}) : super(key: key);

  void addOrRemove({BuildContext context, bool isSaved}) {
    if (isSaved) {
      context.read<LikeBloc>()..add(RemoveMovieFromLikes(movie));
      ToastAlertDialog.showAlert(context, "${movie.title} is removed from favourite",
        title: "removed",
        alignDouble: .92,
        icon: Icons.done,
      );
    } else {
      context.read<LikeBloc>()..add(AddMovieToLikes(movie));
      ToastAlertDialog.showAlert(context, "${movie.title} is added to favourite",
        title: "Add",
        alignDouble: .92,
        icon: Icons.done,
      );
    }

  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.watch<LikeBloc>(),
      builder: (context, snapshot) {
        isLiked =
            context.read<LikeBloc>().box.keys.contains(movie.id.toString());
        return GestureDetector(
          child: HeartIconWidget(isAdd: isLiked),
          onTap: () => addOrRemove(context: context, isSaved: isLiked),
        );
      },
    );
  }
}
