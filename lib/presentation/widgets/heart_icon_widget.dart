import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartIconWidget extends StatelessWidget {
  final bool isAdd;

  const HeartIconWidget({Key key, this.isAdd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      (isAdd) ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
      size: MediaQuery.of(context).size.width / 9.5,
      color: Colors.white,
    );
  }
}
