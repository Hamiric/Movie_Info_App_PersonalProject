import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app_personalproject/data/models/movie_detail_dto.dart';

void main() {
  test('movie_detail_dto test', () {
    const String testJson = """
{
  "adult": false,
  "backdrop_path": "/cjEcqdRdPQJhYre3HUAc5538Gk8.jpg",
  "belongs_to_collection": null,
  "budget": 250000000,
  "genres": [
    {
      "id": 28,
      "name": "Action"
    },
    {
      "id": 14,
      "name": "Fantasy"
    },
    {
      "id": 35,
      "name": "Comedy"
    }
  ],
  "homepage": "https://www.amazon.com/salp/redonemovie",
  "id": 845781,
  "imdb_id": "tt14948432",
  "origin_country": [
    "US"
  ],
  "original_language": "en",
  "original_title": "Red One",
  "overview": "After Santa Claus (codename: Red One) is kidnapped, the North Pole's Head of Security must team up with the world's most infamous tracker in a globe-trotting, action-packed mission to save Christmas.",
  "popularity": 5364.959,
  "poster_path": "/cdqLnri3NEGcmfnqwk2TSIYtddg.jpg",
  "production_companies": [
    {
      "id": 73669,
      "logo_path": "/9JmgzVUNvUN5KhZjmiVHEzPtFCc.png",
      "name": "Seven Bucks Productions",
      "origin_country": "US"
    },
    {
      "id": 92693,
      "logo_path": "/rMKRo8kFoJKxZr0MFEVRoZ8b54E.png",
      "name": "The Detective Agency",
      "origin_country": "US"
    },
    {
      "id": 25998,
      "logo_path": null,
      "name": "Chris Morgan Productions",
      "origin_country": "US"
    },
    {
      "id": 21,
      "logo_path": "/usUnaYV6hQnlVAXP6r4HwrlLFPG.png",
      "name": "Metro-Goldwyn-Mayer",
      "origin_country": "US"
    }
  ],
  "production_countries": [
    {
      "iso_3166_1": "US",
      "name": "United States of America"
    }
  ],
  "release_date": "2024-10-31",
  "revenue": 181803190,
  "runtime": 124,
  "spoken_languages": [
    {
      "english_name": "English",
      "iso_639_1": "en",
      "name": "English"
    },
    {
      "english_name": "Georgian",
      "iso_639_1": "ka",
      "name": "ქართული"
    }
  ],
  "status": "Released",
  "tagline": "The mission to save Christmas is on.",
  "title": "Red One",
  "video": false,
  "vote_average": 6.984,
  "vote_count": 1280
}
""";

    final movie = MovieDetailDto.fromJson(jsonDecode(testJson));

    expect(movie.status, "Released");
    expect(movie.genres[0].id, 28);
  });
}
