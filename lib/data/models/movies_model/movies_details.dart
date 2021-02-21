import 'package:hive/hive.dart';
import 'package:movies_app_with_BLoC/data/constants/static_data.dart';

part 'movies_details.g.dart';

// ignore: must_be_immutable
@HiveType(typeId: 100)
class MoviesDetails {
  @HiveField(0)
  bool adult;
  @HiveField(1)
  String backdropPath;
  @HiveField(2)
  List<int> genreIds;
  @HiveField(3)
  var id;
  @HiveField(4)
  String originalLanguage;
  @HiveField(5)
  String originalTitle;
  @HiveField(6)
  String overview;
  @HiveField(7)
  var popularity;
  @HiveField(8)
  String posterPath;
  @HiveField(9)
  String releaseDate;
  @HiveField(10)
  String title;
  @HiveField(11)
  bool video;
  @HiveField(12)
  var voteAverage;
  @HiveField(13)
  var voteCount;

  MoviesDetails(
      {this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  MoviesDetails.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      adult = json['adult'];
      backdropPath = (json['backdrop_path'] == null)
          ? StaticData().noImageUrlCover
          : "${StaticData().imageUrlPrefix}${json['backdrop_path']}";
      genreIds = json['genre_ids'].cast<int>();
      id = json['id'];
      originalLanguage = json['original_language'];
      originalTitle = json['original_title'];
      overview = json['overview'];
      popularity = json['popularity'];
      posterPath = (json['poster_path'] == null)
          ? StaticData().noImageUrl
          : '${StaticData().imageUrlPrefix}${json['poster_path']}';

      releaseDate = json['release_date'];
      title = (json['title'] == null) ? "no title" : json['title'];
      video = json['video'];
      voteAverage = json['vote_average'];
      voteCount = json['vote_count'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}
