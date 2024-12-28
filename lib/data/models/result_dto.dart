class Result {
  bool adult;
  String backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  Result copyWith({
    bool? adult,
    String? backdropPath,
    List<int>? genreIds,
    int? id,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      Result(
          adult: adult ?? this.adult,
          backdropPath: backdropPath ?? this.backdropPath,
          genreIds: genreIds ?? this.genreIds,
          id: id ?? this.id,
          originalLanguage: originalLanguage ?? this.originalLanguage,
          originalTitle: originalTitle ?? this.originalTitle,
          overview: overview ?? this.overview,
          popularity: popularity ?? this.popularity,
          posterPath: posterPath ?? this.posterPath,
          releaseDate: releaseDate ?? this.releaseDate,
          title: title ?? this.title,
          video: video ?? this.video,
          voteAverage: voteAverage ?? this.voteAverage,
          voteCount: voteCount ?? this.voteCount);

  Result.fromJson(Map<String, dynamic> json)
      : this(
          adult: json['adult'],
          backdropPath: json['backdrop_path'] ?? '',
          genreIds:
              List<int>.from(json['genre_ids'].map((item) => item as int)),
          id: json['id'],
          originalLanguage: json['original_language'],
          originalTitle: json['original_title'],
          overview: json['overview'],
          popularity: json['popularity'].toDouble(),
          posterPath: json['poster_path'] ?? '',
          releaseDate: json['release_date'],
          title: json['title'],
          video: json['video'],
          voteAverage: json['vote_average'].toDouble(),
          voteCount: json['vote_count'],
        );
}