import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomizedIcons extends StatelessWidget {
  final double size1;
  final double size2;
  final IconData icon1;
  final IconData icon2;
  final String innerText;
  final String underlineText;

  const CustomizedIcons(
      {Key key,
      this.size1,
      this.size2,
      this.icon1,
      this.icon2,
      this.innerText,
      this.underlineText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              (icon1 == null) ? CupertinoIcons.circle : icon1,
              size: size1,
              color: Colors.red[900],
            ),
            Icon(
              (icon2 == null) ? CupertinoIcons.circle_fill : icon2,
              size: size2,
              color: Colors.red[900],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$innerText",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 7.5),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            underlineText,
            style: TextStyle(
              fontSize: 9,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
