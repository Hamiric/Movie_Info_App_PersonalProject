import 'package:movie_info_app_personalproject/data/models/result_dto.dart';

class Movie {
  final int id;
  final String posterPath;

  Movie({
    required this.id,
    required this.posterPath,
  });

  Movie copyWith({
    int? id,
    String? posterPath,
  }) =>
      Movie(id: id ?? this.id, posterPath: posterPath ?? this.posterPath);

  Movie.fromData(Result data)
      : this(
          id: data.id,
          posterPath: data.posterPath,
        );
}
