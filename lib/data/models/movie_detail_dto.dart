class MovieDetailDto {
  bool adult;
  String backdropPath;
  String? belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  String imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  List<ProductionCompany> productionCompanies;
  List<ProductionCountry> productionCountries;
  DateTime releaseDate;
  int revenue;
  int runtime;
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

  MovieDetailDto({
    required this.adult,
    required this.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetailDto copyWith({
    bool? adult,
    String? backdropPath,
    String? belongsToCollection,
    int? budget,
    List<Genre>? genres,
    String? homepage,
    int? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    List<ProductionCompany>? productionCompanies,
    List<ProductionCountry>? productionCountries,
    DateTime? releaseDate,
    int? revenue,
    int? runtime,
    List<SpokenLanguage>? spokenLanguages,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieDetailDto(
        adult: adult ?? this.adult,
        backdropPath: backdropPath ?? this.backdropPath,
        belongsToCollection: belongsToCollection ?? this.belongsToCollection,
        budget: budget ?? this.budget,
        genres: genres ?? this.genres,
        homepage: homepage ?? this.homepage,
        id: id ?? this.id,
        imdbId: imdbId ?? this.imdbId,
        originCountry: originCountry ?? this.originCountry,
        originalLanguage: originalLanguage ?? this.originalLanguage,
        originalTitle: originalTitle ?? this.originalTitle,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        posterPath: posterPath ?? this.posterPath,
        productionCompanies: productionCompanies ?? this.productionCompanies,
        productionCountries: productionCountries ?? this.productionCountries,
        releaseDate: releaseDate ?? this.releaseDate,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        spokenLanguages: spokenLanguages ?? this.spokenLanguages,
        status: status ?? this.status,
        tagline: tagline ?? this.tagline,
        title: title ?? this.title,
        video: video ?? this.video,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  MovieDetailDto.fromJson(Map<String, dynamic> json)
      : this(
          adult: json['adult'],
          backdropPath: json['backdrop_path'],
          belongsToCollection: json['belongs_to_collection'],
          budget: json['budget'],
          genres: List<Genre>.from(
              json['genres'].map((item) => Genre.fromJson(item))),
          homepage: json['homepage'],
          id: json['id'],
          imdbId: json['imdb_id'],
          originCountry: List<String>.from(
              json['origin_country'].map((item) => item as String)),
          originalLanguage: json['original_language'],
          originalTitle: json['original_title'],
          overview: json['overview'],
          popularity: json['popularity'],
          posterPath: json['poster_path'],
          productionCompanies: List<ProductionCompany>.from(
              json['production_companies']
                  .map((item) => ProductionCompany.fromJson(item))),
          productionCountries: List<ProductionCountry>.from(
              json['production_countries']
                  .map((item) => ProductionCountry.fromJson(item))),
          releaseDate: DateTime.parse(json['release_date']),
          revenue: json['revenue'],
          runtime: json['runtime'],
          spokenLanguages: List<SpokenLanguage>.from(json['spoken_languages']
              .map((item) => SpokenLanguage.fromJson(item))),
          status: json['status'],
          tagline: json['tagline'],
          title: json['title'],
          video: json['video'],
          voteAverage: json['vote_average'],
          voteCount: json['vote_count'],
        );
}

class Genre {
  int id;
  String name;

  Genre({
    required this.id,
    required this.name,
  });

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(id: id ?? this.id, name: name ?? this.name);

  Genre.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          name: json['name'],
        );
}

class ProductionCompany {
  int id;
  String? logoPath;
  String name;
  String originCountry;

  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  ProductionCompany copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) =>
      ProductionCompany(
        id: id ?? this.id,
        logoPath: logoPath ?? this.logoPath,
        name: name ?? this.name,
        originCountry: originCountry ?? this.originCountry,
      );

  ProductionCompany.fromJson(Map<String, dynamic> json)
      : this(
            id: json['id'],
            logoPath: json['logo_path'],
            name: json['name'],
            originCountry: json['origin_country']);
}

class ProductionCountry {
  String iso31661;
  String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  ProductionCountry copyWith({
    String? iso31661,
    String? name,
  }) =>
      ProductionCountry(
        iso31661: iso31661 ?? this.iso31661,
        name: name ?? this.name,
      );

  ProductionCountry.fromJson(Map<String, dynamic> json)
      : this(
          iso31661: json['iso_3166_1'],
          name: json['name'],
        );
}

class SpokenLanguage {
  String englishName;
  String iso6391;
  String name;

  SpokenLanguage({
    required this.englishName,
    required this.iso6391,
    required this.name,
  });

  SpokenLanguage copyWith({
    String? englishName,
    String? iso6391,
    String? name,
  }) =>
      SpokenLanguage(
        englishName: englishName ?? this.englishName,
        iso6391: iso6391 ?? this.iso6391,
        name: name ?? this.name,
      );

  SpokenLanguage.fromJson(Map<String, dynamic> json)
      : this(
          englishName: json['english_name'],
          iso6391: json['iso_639_1'],
          name: json['name'],
        );
}
