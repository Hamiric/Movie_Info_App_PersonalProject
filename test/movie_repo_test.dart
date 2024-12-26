import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app_personalproject/data/repositories/movie_repository_impl.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';

void main(){
  test('movie_repo_test', () async {
    final env = Env();
    await env.loadEnv();

    final options = BaseOptions(headers: {
      'Authorization': 'Bearer ${env.getKey('TMDB_ACCESS_TOKEN')}',
      'Accept': 'application/json',
    });

    final dio = Dio(options);


    final movieRepositoryImpl = MovieRepositoryImpl(dio);

    List<Movie>? nowPlayingMovies =
      await movieRepositoryImpl.fetchNowPlayingMovies();
    // print(nowPlayingMovies![0].id);
    expect(nowPlayingMovies![0].id, 845781);

    List<Movie>? popularMovies = await movieRepositoryImpl.fetchPopularMovies();
    // print(popularMovies![0].id);
    expect(popularMovies![0].id, 845781);

    List<Movie>? topRatedMovies = await movieRepositoryImpl.fetchTopRatedMovies();
    // print(topRatedMovies![0].id);
    expect(topRatedMovies![0].id, 278);

    List<Movie>? upcomingMovies = await movieRepositoryImpl.fetchUpcomingMovies();
    // print(upcomingMovies![0].id);
    expect(upcomingMovies![0].id, 939243);

    MovieDetail? movieDetail = await movieRepositoryImpl.fetchMovieDetail(845781);
    // print(movieDetail!.id);
    expect(movieDetail!.id, 845781);
  });
}