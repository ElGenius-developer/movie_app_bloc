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
    return Container(
        height: StaticData.size.height / 4.2, //165,
        width: StaticData.size.width,
        child: Card(
          color: Colors.transparent,
          child: BlocBuilder<TrendingBloc, TrendingState>(
            builder: (context, state) {
              if (state is LoadingTrending || state is TrendingInitial) {
                return Container(
                  height: StaticData.size.height / 136,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    // minHeight: 4,
                    valueColor: AlwaysStoppedAnimation(Colors.red.shade700),
                  ),
                );
              } else if (state is SuccessLoadingTrend) {
                final movies = state.trendingMovies;
                return Container(
                    height: StaticData.size.height / 5, //165,
                    width: StaticData.size.width,
                    child: CarouselSlider(
                        items: List.generate(
                          movies.results.length ?? 0,
                          (index) => GestureDetector(
                            child: Stack(
                              alignment: Alignment.center,
                              fit: StackFit.loose,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Hero(
                                    tag: "trend:$index",
                                    child: Image.network(
                                      movies.results[index].backdropPath,
                                      height: StaticData.size.height / 4,
                                      width:
                                          StaticData.size.width * .75 /*310*/,
                                      fit: BoxFit.cover,
                                    ),
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
                          height: StaticData.size.height / 4,
                          aspectRatio:
                              StaticData.size.aspectRatio * 2.95, //16 / 9,
                          viewportFraction: StaticData.size.aspectRatio * 1.55,
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
