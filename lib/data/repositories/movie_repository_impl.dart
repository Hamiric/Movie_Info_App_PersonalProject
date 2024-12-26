import 'package:movie_info_app_personalproject/data/sources/movie_data_source.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';
import 'package:movie_info_app_personalproject/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final dio;

  MovieRepositoryImpl(this.dio);

  /// 영화 현재 상영중 데이터 가져오기
  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    final movieDataSourceImpl = MovieDataSourceImpl(dio);

    final nowPlayingMovies = await movieDataSourceImpl.fetchNowPlayingMovies();
    final list =
        nowPlayingMovies!.results.map((item) => Movie.fromData(item)).toList();

    return list;
  }

  /// 영화 인기순 데이터 가져오기
  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    final movieDataSourceImpl = MovieDataSourceImpl(dio);

    final popularMovies = await movieDataSourceImpl.fetchPopularMovies();
    final list =
        popularMovies!.results.map((item) => Movie.fromData(item)).toList();

    return list;
  }

  /// 영화 평점 높은순 데이터 가져오기
  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    final movieDataSourceImpl = MovieDataSourceImpl(dio);

    final topRatedMovies = await movieDataSourceImpl.fetchTopRatedMovies();
    final list =
        topRatedMovies!.results.map((item) => Movie.fromData(item)).toList();

    return list;
  }

  /// 영화 개봉예정 데이터 가져오기
  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    final movieDataSourceImpl = MovieDataSourceImpl(dio);

    final upcomingMovies = await movieDataSourceImpl.fetchUpcomingMovies();
    final list =
        upcomingMovies!.results.map((item) => Movie.fromData(item)).toList();

    return list;
  }

  /// 영화 상세 데이터 가져오기
  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    final movieDataSourceImpl = MovieDataSourceImpl(dio);

    final movieDetail = await movieDataSourceImpl.fetchMovieDetail(id);

    return MovieDetail.fromData(movieDetail!);
  }
}