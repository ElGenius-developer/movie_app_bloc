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
        tag: "body:$index",
        child: Container(
          width: width / 1.35 /*248*/,
          height: height / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.red[900], width: 5)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image(
              fit: BoxFit.cover,
              image: poster,
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(13),
            topLeft: Radius.circular(13),
            bottomLeft: Radius.circular(24),
            bottomRight: Radius.circular(24),
          ),
          child: Container(
            alignment: Alignment.center,
            width: width * .716,
            height: height / 14.2,
            color: Colors.black.withAlpha(160),
            child: Text(
              movies.results[index].title,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontSize: 17, shadows: [
                Shadow(color: Colors.red, offset: Offset(-.4, -.3)),
                Shadow(color: Colors.red, offset: Offset(.4, .3)),
                Shadow(color: Colors.red, offset: Offset(.4, -.3)),
                Shadow(color: Colors.red, offset: Offset(-.4, .3))
              ]),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      )
    ]);
  }
}
