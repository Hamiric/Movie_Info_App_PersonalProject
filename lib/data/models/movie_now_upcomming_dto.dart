import 'package:movie_info_app_personalproject/data/models/result_dto.dart';

class MovieNowUpcommingDto {
  Dates dates;
  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  MovieNowUpcommingDto({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  MovieNowUpcommingDto copyWith({
    Dates? dates,
    int? page,
    List<Result>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      MovieNowUpcommingDto(
          dates: dates ?? this.dates,
          page: page ?? this.page,
          results: results ?? this.results,
          totalPages: totalPages ?? this.totalPages,
          totalResults: totalResults ?? this.totalResults);

  MovieNowUpcommingDto.fromJson(Map<String, dynamic> json)
      : this(
          dates: Dates.fromJson(json['dates']),
          page: json['page'],
          results: List<Result>.from(
              json['results'].map((item) => Result.fromJson(item))),
          totalPages: json['total_pages'],
          totalResults: json['total_results'],
        );
}

class Dates {
  DateTime maximum;
  DateTime minimum;

  Dates({
    required this.maximum,
    required this.minimum,
  });

  Dates copyWith({
    DateTime? maximum,
    DateTime? minimum,
  }) =>
      Dates(maximum: maximum ?? this.maximum, minimum: minimum ?? this.minimum);

  Dates.fromJson(Map<String, dynamic> json)
      : this(
          maximum: DateTime.parse(json['maximum']),
          minimum: DateTime.parse(json['minimum']),
        );
}
