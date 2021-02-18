// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviesDetailsAdapter extends TypeAdapter<MoviesDetails> {
  @override
  final int typeId = 100;

  @override
  MoviesDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MoviesDetails(
      adult: fields[0] as bool,
      backdropPath: fields[1] as String,
      genreIds: (fields[2] as List)?.cast<int>(),
      id: fields[3] as dynamic,
      originalLanguage: fields[4] as String,
      originalTitle: fields[5] as String,
      overview: fields[6] as String,
      popularity: fields[7] as dynamic,
      posterPath: fields[8] as String,
      releaseDate: fields[9] as String,
      title: fields[10] as String,
      video: fields[11] as bool,
      voteAverage: fields[12] as dynamic,
      voteCount: fields[13] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, MoviesDetails obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviesDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
