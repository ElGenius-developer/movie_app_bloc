import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/logic/blocs/links_bloc/links_bloc.dart';

class YouTubeButton extends StatelessWidget {
  final int movieId;

  const YouTubeButton({
    Key key,
    this.movieId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[900],
                ),
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                child: Container(
                  width: 20,
                  height: 10,
                  child: Icon(
                    Icons.play_arrow,
                    size: 12,
                    color: Colors.red,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  "Trailer",
                  style: TextStyle(
                    fontSize: 9,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          BlocProvider.of<LinksBloc>(context)
              .add(LaunchTrailer(movieID: movieId));
          var state = context.read<LinksBloc>().state;
          print(state.toString());
          if (state is ErrorLaunching) {
            BotToast.showSimpleNotification(
                title: "Sorry This Link cannot be launch",
                duration: Duration(seconds: 2));
          }
        });
  }
}
