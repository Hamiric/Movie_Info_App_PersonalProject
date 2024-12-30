import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app_personalproject/data/models/movie_detail_dto.dart';
import 'package:movie_info_app_personalproject/data/models/movie_now_upcomming_dto.dart';
import 'package:movie_info_app_personalproject/data/models/movie_popular_top_search_dto.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/data/sources/movie_data_source.dart';

void main() {
  test('movie_response_dto_source test', () async {
    final env = Env();
    await env.loadEnv();

    final options = BaseOptions(headers: {
      'Authorization': 'Bearer ${env.getKey('TMDB_ACCESS_TOKEN')}',
      'Accept': 'application/json',
    });

    final dio = Dio(options);


    final movieDataSourceimpl = MovieDataSourceImpl(dio);

    MovieNowUpcommingDto? nowPlayingMovies =
        await movieDataSourceimpl.fetchNowPlayingMovies();
    expect(nowPlayingMovies!.page, 1);

    MovieDetailDto? movieDetail =
        await movieDataSourceimpl.fetchMovieDetail(845781);
    expect(movieDetail!.id, 845781);
    
    MoviePopularSearchTopDto? popularMovies =
        await movieDataSourceimpl.fetchPopularMovies();
    expect(popularMovies!.page, 1);

    MoviePopularSearchTopDto? topRatedMovies =
        await movieDataSourceimpl.fetchTopRatedMovies();
    expect(topRatedMovies!.page, 1);

    MovieNowUpcommingDto? upcomingMovies =
        await movieDataSourceimpl.fetchUpcomingMovies();
    expect(upcomingMovies!.page, 1);

    MoviePopularSearchTopDto? searchMovies =
        await movieDataSourceimpl.fetchMovieSearch('The Babadook');
    expect(searchMovies!.page, 1);
  });
}
