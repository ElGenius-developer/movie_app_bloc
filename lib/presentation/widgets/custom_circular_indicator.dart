import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class CustomCircularIndicator extends StatelessWidget {
  final double progress;

  const CustomCircularIndicator({Key key, @required this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height:150,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: LiquidCircularProgressIndicator(
          value: progress,
          // Defaults to// 0.5.

          valueColor: AlwaysStoppedAnimation(Colors.red.shade900),
          backgroundColor: Colors.transparent,
          // Defaults to the current Theme's backgroundColor.
          borderColor: Colors.red.shade900,
          borderWidth: 5.0,
          direction: Axis.horizontal,
          // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
          center: Text(
            "Loading...",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(  fontSize: 20),
          ),
        ),
      ),
    );
  }
}
