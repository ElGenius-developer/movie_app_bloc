import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
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
          padding: const EdgeInsets.only(right: 5.0),
          child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: StaticData.size.width / 11,
                height: StaticData.size.width / 11,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red[900],
                ),
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 10),
                child: Container(
                  width: StaticData.size.width / 20.5,
                  height: StaticData.size.width / 41,
                  child: Icon(
                    Icons.play_arrow,
                    size: 13,
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
                    fontSize: StaticData.size.width / 45,
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
