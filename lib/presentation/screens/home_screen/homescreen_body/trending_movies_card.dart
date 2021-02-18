import 'package:bot_toast/bot_toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/constants/static_data.dart';
import '../../../../logic/blocs/cast_bloc/cast_bloc.dart';
import '../../../../logic/blocs/trending_bloc/trending_bloc.dart';
import '../../../routers/router_arguments.dart';
import '../../../widgets/my_cached_image_network.dart';

class TrendingMoviesContainer extends StatelessWidget {
  const TrendingMoviesContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height / 5, //165,

        child: Card(
          color: Colors.transparent.withAlpha(1),
          child: BlocBuilder<TrendingBloc, TrendingState>(
            builder: (context, state) {
              if (state is LoadingTrending || state is TrendingInitial) {
                return Container(
                  height: 5,
                  // width: 100,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.symmetric(horizontal: 35),
                  child: CircularProgressIndicator(
                    // minHeight: 4,
                    valueColor: AlwaysStoppedAnimation(Colors.red.shade700),
                  ),
                );
              } else if (state is SuccessLoadingTrend) {
                final movies = state.trendingMovies;
                return Container(
                    height: size.height / 5, //165,
                    child: CarouselSlider(
                        items: List.generate(
                          movies.results.length ?? 0,
                          (index) => GestureDetector(
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Hero(
                                      tag: "trend:$index",
                                      child: Image.network(
                                        movies.results[index].backdropPath,
                                        height: size.height / 5,
                                        width: size.width * .8 /*310*/,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                //// [movie title] //////
                                //////////////////
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  alignment: Alignment.bottomLeft
                                      .add(Alignment(.3, -.1)),
                                  child: Text(
                                    movies.results[index].title,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 15, shadows: [
                                      Shadow(
                                          offset: Offset(.21, .21),
                                          color: Colors.red,
                                          blurRadius: 5),
                                      Shadow(
                                          offset: Offset(.21, -.21),
                                          color: Colors.black,
                                          blurRadius: 5),
                                      Shadow(
                                          offset: Offset(-.21, .21),
                                          color: Colors.black,
                                          blurRadius: 5),
                                      Shadow(
                                          offset: Offset(-.21, -.21),
                                          color: Colors.black)
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () {
                              context
                                  .read<CastBloc>()
                                  .add(FetchingCast(movies.results[index].id));
                              Navigator.pushNamed(context, "/detailScreen",
                                  arguments:
                                      ScreenArguments(index, "trend:$index"));
                            },
                          ),
                        ),
                        options: CarouselOptions(
                          height: size.height / 4.6,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          //Enable it later
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                          //fastOutSlowIn
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        )));
              } else {
                BotToast.showText(
                    duration: Duration(seconds: 2),
                    text: ("Error Loading Trending movies"));
                return MyCachedImageNetwork(
                  url: StaticData().noImageUrl,
                  boxFit: BoxFit.cover,
                );
              }
            },
          ),
        ));
  }
}
