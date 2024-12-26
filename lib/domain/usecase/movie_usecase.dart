import 'package:movie_info_app_personalproject/data/repositories/movie_repository_impl.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';

class MovieUsecase {
  final MovieRepositoryImpl _movieRepositoryImpl;

  MovieUsecase(this._movieRepositoryImpl);

  Future<List<Movie>?> fetchNowPlayingMovies() async {
    return await _movieRepositoryImpl.fetchNowPlayingMovies();
  }

  Future<List<Movie>?> fetchPopularMovies() async {
    return await _movieRepositoryImpl.fetchPopularMovies();
  }

  Future<List<Movie>?> fetchTopRatedMovies() async {
    return await _movieRepositoryImpl.fetchTopRatedMovies();
  }

  Future<List<Movie>?> fetchUpcomingMovies() async {
    return await _movieRepositoryImpl.fetchUpcomingMovies();
  }

  Future<MovieDetail?> fetchMovieDetail(int id) async {
    return await _movieRepositoryImpl.fetchMovieDetail(id);
  }
}