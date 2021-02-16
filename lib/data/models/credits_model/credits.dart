import 'cast.dart';

class Credits {
  int id;
  List<Cast> cast;
  String error;

  Credits({
    this.id,
    this.cast,
  });

  Credits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['cast'] != null) {
      cast = new List<Cast>();
      json['cast'].forEach((v) {
        cast.add(new Cast.fromJson(v));
      });
    }
  }
  Credits.withError(String errorValue)
      : cast = List(),
        error = errorValue;
}
