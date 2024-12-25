import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app_personalproject/data/models/movie_detail_dto.dart';
import 'package:movie_info_app_personalproject/data/models/movie_now_upcomming_dto.dart';
import 'package:movie_info_app_personalproject/data/models/movie_popular_top_dto.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/data/sources/movie_data_source.dart';

void main() {
  test('movie_response_dto_crud test', () async {
    final env = Env();
    await env.loadEnv();

    final options = BaseOptions(headers: {
      'Authorization': 'Bearer ${env.getKey('TMDB_ACCESS_TOKEN')}',
      'Accept': 'application/json',
    });

    final dio = Dio(options);


    final movieDataSourceCRUD = MovieDataSourceCRUD(dio);

    MovieNowUpcommingDto? nowPlayingMovies =
        await movieDataSourceCRUD.fetchNowPlayingMovies();
    expect(nowPlayingMovies!.page, 1);

    print(1);

    MovieDetailDto? movieDetail =
        await movieDataSourceCRUD.fetchMovieDetail(845781);
    expect(movieDetail!.id, 845781);

    print(2);
    
    MoviePopularTopDto? popularMovies =
        await movieDataSourceCRUD.fetchPopularMovies();
    expect(popularMovies!.page, 1);

    print(3);

    MoviePopularTopDto? topRatedMovies =
        await movieDataSourceCRUD.fetchTopRatedMovies();
    expect(topRatedMovies!.page, 1);

    print(4);

    MovieNowUpcommingDto? upcomingMovies =
        await movieDataSourceCRUD.fetchUpcomingMovies();
    expect(upcomingMovies!.page, 1);

    print(5);
  });
}
