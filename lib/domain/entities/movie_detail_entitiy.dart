import 'package:movie_info_app_personalproject/data/models/movie_detail_dto.dart';

class MovieDetail {
  final int budget;
  final List<String> genres;
  final int id;
  final List<String> productionCompanyLogos;
  final String overview;
  final double popularity;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String tagline;
  final String title;
  final double voteAverage;
  final int voteCount;

  MovieDetail({
    required this.budget,
    required this.genres,
    required this.id,
    required this.productionCompanyLogos,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.tagline,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  MovieDetail copyWith({
    int? budget,
    List<String>? genres,
    int? id,
    List<String>? productionCompanyLogos,
    String? overview,
    double? popularity,
    String? releaseDate,
    int? revenue,
    int? runtime,
    String? tagline,
    String? title,
    double? voteAverage,
    int? voteCount,
  }) =>
      MovieDetail(
        budget: budget ?? this.budget,
        genres: genres ?? this.genres,
        id: id ?? this.id,
        productionCompanyLogos:
            productionCompanyLogos ?? this.productionCompanyLogos,
        overview: overview ?? this.overview,
        popularity: popularity ?? this.popularity,
        releaseDate: releaseDate ?? this.releaseDate,
        revenue: revenue ?? this.revenue,
        runtime: runtime ?? this.runtime,
        tagline: tagline ?? this.tagline,
        title: title ?? this.title,
        voteAverage: voteAverage ?? this.voteAverage,
        voteCount: voteCount ?? this.voteCount,
      );

  MovieDetail.fromData(MovieDetailDto data)
      : this(
          budget: data.budget,
          genres: data.genres.map((item) => item.name).toList(),
          id: data.id,
          productionCompanyLogos: data.productionCompanies
              .map((item) => item.logoPath.toString()).toList(),
          overview: data.overview,
          popularity: data.popularity,
          releaseDate: data.releaseDate,
          revenue: data.revenue,
          runtime: data.runtime,
          tagline: data.tagline,
          title: data.title,
          voteAverage: data.voteAverage,
          voteCount: data.voteCount,
        );
}
