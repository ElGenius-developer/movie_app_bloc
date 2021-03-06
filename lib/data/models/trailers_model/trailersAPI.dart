class Trailers {
  int id;
  List<TrailersResults> results;

  Trailers({this.id, this.results});

  Trailers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      results = <TrailersResults>[];
      json['results'].forEach((v) {
        results.add(new TrailersResults.fromJson(v));
      });
    }
  }
}

class TrailersResults {
  String id;
  String key;
  String name;
  String site;
  String type;

  TrailersResults({this.id, this.key, this.name, this.site, this.type});

  TrailersResults.fromJson(Map<String, dynamic> json) {
    id = json['id'];

    key = json['key'];
    name = json['name'];
    site = json['site'];
    type = json['type'];
  }
}
