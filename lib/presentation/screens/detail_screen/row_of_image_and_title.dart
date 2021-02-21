import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/data/models/movies_model/movies_details.dart';
import 'package:movies_app_with_BLoC/presentation/widgets/my_cached_image_network.dart';

class RowImageAndTitle extends StatelessWidget {
  final int index;
  final List<MoviesDetails> movies;

  const RowImageAndTitle({this.index, this.movies});

  @override
  Widget build(BuildContext context) {
     return Container(
      width: StaticData.size.width - 5,
      height: StaticData.size.height / 2.89,
      child: Card(

        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10),
              width: StaticData.size.width / 2.5,
              height: StaticData.size.height / 2,
              child: MyCachedImageNetwork(
                boxFit: BoxFit.scaleDown,
                url: (movies.isNotEmpty)?movies[index].posterPath:"",
              ),
            ),
            //the second row (image , title, language , release date
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: StaticData.size.width * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //////////
                    ///title/////
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        "${movies[index].title}",
                        // textAlign: TextAlign.justify,

                        style: TextStyle(
                            fontSize: 20,
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
                              style: Theme.of(context).textTheme.headline6.copyWith(
                                  fontSize : 20,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 1.2,
                                        color: Colors.red)
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
