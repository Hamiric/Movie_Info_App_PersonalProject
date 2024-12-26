import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';

abstract interface class MovieRepository {
  Future<List<Movie>?> fetchNowPlayingMovies();

  Future<List<Movie>?> fetchPopularMovies();

  Future<List<Movie>?> fetchTopRatedMovies();

  Future<List<Movie>?> fetchUpcomingMovies();

  Future<MovieDetail?> fetchMovieDetail(int id);
}
