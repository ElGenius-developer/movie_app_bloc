import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/movies_details.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/my_cached_image_network.dart';

class RowImageAndTitle extends StatelessWidget {
  final int index;
  final List<MoviesDetails> movies;

  const RowImageAndTitle({this.index, this.movies});

  @override
  Widget build(BuildContext context) {
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
              child: MyCachedImageNetwork(
                boxFit: BoxFit.scaleDown,
                url: movies[index].posterPath,
              ),
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
                        "${movies[index].title}",
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
                                text: movies[index].originalLanguage,
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
                          movies[index].releaseDate ?? '' + '  (Released)',
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
