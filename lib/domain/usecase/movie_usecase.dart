import 'package:movie_info_app_personalproject/data/repositories/movie_repository_impl.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';

class MovieUsecase {
  final dio;

  MovieUsecase(this.dio);

  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final MovieRepositoryImpl movieRepositoryImpl = MovieRepositoryImpl(dio);
    return await movieRepositoryImpl.fetchNowPlayingMovies();
  }

  Future<List<Movie>?> fetchPopularMovies() async {
    final MovieRepositoryImpl movieRepositoryImpl = MovieRepositoryImpl(dio);
    return await movieRepositoryImpl.fetchPopularMovies();
  }

  Future<List<Movie>?> fetchTopRatedMovies() async {
    final MovieRepositoryImpl movieRepositoryImpl = MovieRepositoryImpl(dio);
    return await movieRepositoryImpl.fetchTopRatedMovies();
  }

  Future<List<Movie>?> fetchUpcomingMovies() async {
    final MovieRepositoryImpl movieRepositoryImpl = MovieRepositoryImpl(dio);
    return await movieRepositoryImpl.fetchUpcomingMovies();
  }

  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final MovieRepositoryImpl movieRepositoryImpl = MovieRepositoryImpl(dio);
    return await movieRepositoryImpl.fetchMovieDetail(id);
  }

  Future<List<Movie>?> fetchMovieSearch(List<String> query) async{
    final MovieRepositoryImpl movieRepositoryImpl = MovieRepositoryImpl(dio);
    return await movieRepositoryImpl.fetchMovieSearch(query);
  }
}