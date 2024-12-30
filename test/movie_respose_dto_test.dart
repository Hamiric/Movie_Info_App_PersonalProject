import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app_personalproject/data/models/movie_now_upcomming_dto.dart';

void main() {
  test('movie_response_dto test', () {
    const String testJson = """
{
  "dates": {
    "maximum": "2025-01-01",
    "minimum": "2024-11-20"
  },
  "page": 1,
  "results": [
    {
      "adult": false,
      "backdrop_path": "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
      "genre_ids": [
        28,
        14,
        35
      ],
      "id": 845781,
      "original_language": "en",
      "original_title": "Red One",
      "overview": "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
      "popularity": 5364.959,
      "poster_path": "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
      "release_date": "2024-10-31",
      "title": "Red One",
      "video": false,
      "vote_average": 7,
      "vote_count": 1276
    }
  ],
  "total_pages": 229,
  "total_results": 4573
}
""";

    final movie = MovieNowUpcommingDto.fromJson(jsonDecode(testJson));

    expect(movie.page, 1);
    expect(movie.results[0].genreIds[0], 28);
  });
}
