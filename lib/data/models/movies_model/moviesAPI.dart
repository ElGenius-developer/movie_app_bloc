import 'movies_details.dart';

class Movies {
  int page;
  List<MoviesDetails> results;
  int totalPages;
  int totalResults;
  String error;

  Movies(
      {this.page = 1,
      this.results,
      this.totalPages = 4,
      this.totalResults = 0});

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = new List<MoviesDetails>();
      json['results'].forEach((v) {
        results.add(new MoviesDetails.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Movies.withError(String errorValue)
      : results = List(),
        error = errorValue;
}
