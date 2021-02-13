import 'package:cached_network_image/cached_network_image.dart';

class ScreenArguments {
  final int index;
  final CachedNetworkImageProvider poster;
  final CachedNetworkImageProvider cover;

  ScreenArguments(this.index, this.poster, this.cover);
}
