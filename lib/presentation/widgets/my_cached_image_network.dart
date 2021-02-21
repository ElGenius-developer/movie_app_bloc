import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';

class MyCachedImageNetwork extends StatelessWidget {
  final String url;
  final BoxFit boxFit;

  const MyCachedImageNetwork(
      {Key key, @required this.url, @required this.boxFit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      alignment: Alignment.topCenter,
      placeholder: (_, url) => Center(
        child: Container(
          width: StaticData.size.width / 4.1,
          height: StaticData.size.aspectRatio * 6.5,
          child: LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.red.shade900),
          ),
        ),
      ),
      errorWidget: (context, url, error) =>
          Icon(CupertinoIcons.exclamationmark_triangle_fill),
      placeholderFadeInDuration: Duration(microseconds: 200),
      fadeOutDuration: Duration(microseconds: 150),
      fadeInCurve: Curves.bounceInOut,
      filterQuality: FilterQuality.high,
    );
  }
}
