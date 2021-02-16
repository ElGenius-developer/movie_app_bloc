import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';
import 'package:movies_app_with_BLoC/logic/blocs/cast_bloc/cast_bloc.dart';

class CastAvatars extends StatelessWidget {
  final int index;
  final CachedNetworkImageProvider imageProvider;

  CastAvatars({@required this.index, @required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width - 5,
        height: MediaQuery.of(context).size.height / 3.8,
        child: Card(
          child: Container(
            width: MediaQuery.of(context).size.width - 15,
            height: MediaQuery.of(context).size.height / 8,
            child: BlocBuilder<CastBloc, CastState>(
              builder: (context, state) {
                 if (state is LoadingCast) {
                  return Container(
                      height: 5,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: LinearProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.red.shade700),
                      ));
                } else if (state is SuccessLoadCast) {
                  // var image = state.credits.cast[index].profilePath;
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: (state.credits.cast == null)
                          ? 0
                          : state.credits.cast.length,
                      // padding: EdgeInsets.only(left: 10),
                      itemBuilder: (context, index) {
                        var image = CastBloc.credits.cast[index].profilePath;
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  radius: 48,
                                  backgroundImage: CachedNetworkImageProvider(
                                      (image==null)
                                          ? StaticData().noImageUrl
                                          : StaticData().imageUrlPrefix +
                                              image)),
                              SizedBox(
                                width: 100,
                                child: Text(
                                  "${state.credits.cast[index].name}",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                    child: Image.network(StaticData().noImageUrl),
                  );
                }
              },
            ),
          ),
        ));
  }
}
