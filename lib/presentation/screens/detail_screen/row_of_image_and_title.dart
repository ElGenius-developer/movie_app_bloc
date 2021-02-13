import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/logic/blocs/movie_bloc/movies_bloc.dart';

class RowImageAndTitle extends StatelessWidget {
  final int index;
  final CachedNetworkImageProvider imageProvider;

  const RowImageAndTitle({this.index, this.imageProvider});

  @override
  Widget build(BuildContext context) {
    var movies = MoviesBloc.movies;
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width - 5,
      height: size.height / 2.89,
      child: Card(
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              width: size.width / 2.5,
              height: size.height / 2,
              child: Image(fit: BoxFit.scaleDown, image: imageProvider),
            ),
            //the second row (image , title, language , release date
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: size.width * .07),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //////////
                    ///title/////
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        "${movies.results[index].title}",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 21,
                            height: 1.2,
                            color: Colors.red[700],
                            shadows: [
                              Shadow(
                                  color: Colors.black54,
                                  offset: Offset(-.1, -1))
                            ],
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    ///Language
                    /////
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(top: 15),
                      child: RichText(
                          text: TextSpan(
                              text: "Language:  ",
                              style: TextStyle(
                                  // color: Colors.w,,
                                  shadows: [
                                    Shadow(
                                        offset: Offset(.3, -.3),
                                        color: Colors.black)
                                  ]),
                              children: [
                            TextSpan(
                                text: movies.results[index].originalLanguage,
                                style: TextStyle(
                                    color: Colors.red[700],
                                    shadows: [
                                      Shadow(
                                          offset: Offset(.15, -.1),
                                          color: Colors.black)
                                    ]))
                          ])),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          movies.results[index].releaseDate + '  (Released)',
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*
bool checkData(DateTime date)
{
  DateTime dateTime = DateTime.now();
  // print("${dateTime.year}-${dateTime.month}-${dateTime.day}");
  if(date.isAfter(dateTime))
  {
    return false;
  }
  else {
    return true;
  }

}*/
