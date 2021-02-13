import 'package:flutter/material.dart';

class MovieCardBody extends StatelessWidget {
  @required
  final index, poster, movies, width, height;

  const MovieCardBody(
      {Key key, this.index, this.poster, this.movies, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Hero(
        tag: index,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.red[900], width: 5)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image(
              image: poster,
            ),
          ),
        ),
      ),
      ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
        child: Container(
          alignment: Alignment.center,
          width: width * .755,
          height: height / 14,
          color: Colors.black54,
          child: Text(
            movies.results[index].title,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 17, shadows: [
              Shadow(color: Colors.red, offset: Offset(-.4, -.3)),
              Shadow(color: Colors.red, offset: Offset(.4, .3))
            ]),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
      )
    ]);
  }
}
