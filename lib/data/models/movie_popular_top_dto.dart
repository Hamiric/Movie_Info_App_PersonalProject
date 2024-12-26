import 'package:movie_info_app_personalproject/data/models/result_dto.dart';

class MoviePopularTopDto {
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  MoviePopularTopDto({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  MoviePopularTopDto copyWith({
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MoviePopularTopDto(
          page: page ?? this.page,
          results: results ?? this.results,
          totalPages: totalPages ?? this.totalPages,
          totalResults: totalResults ?? this.totalResults);

  MoviePopularTopDto.fromJson(Map<String, dynamic> json)
      : this(
          page: json['page'],
          results: List<Result>.from(
              json['results'].map((item) => Result.fromJson(item))),
          totalPages: json['total_pages'],
          totalResults: json['total_results'],
        );
}
