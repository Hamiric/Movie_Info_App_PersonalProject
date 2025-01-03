import 'package:movie_info_app_personalproject/data/models/movie_detail_dto.dart';
import 'package:movie_info_app_personalproject/data/models/movie_now_upcomming_dto.dart';
import 'package:movie_info_app_personalproject/data/models/movie_popular_top_search_dto.dart';

abstract interface class MovieDataSource {
  Future<MovieNowUpcommingDto?> fetchNowPlayingMovies();

  Future<MoviePopularSearchTopDto?> fetchPopularMovies();

  Future<MoviePopularSearchTopDto?> fetchTopRatedMovies();

  Future<MovieNowUpcommingDto?> fetchUpcomingMovies();

  Future<MovieDetailDto?> fetchMovieDetail(int id);

  Future<MoviePopularSearchTopDto?> fetchMovieSearch(String query);
}

class MovieDataSourceImpl implements MovieDataSource {
  final dio;

  MovieDataSourceImpl(this.dio);

  /// 영화 현재 상영중 데이터 가져오기
  @override
  Future<MovieNowUpcommingDto?> fetchNowPlayingMovies() async {
    String url =
        'https://api.themoviedb.org/3/movie/now_playing?language=ko-KR&page=1';
    final response = await dio.get(url);

    final movieResponseDto = MovieNowUpcommingDto.fromJson(response.data);
    return movieResponseDto;
  }

  /// 영화 상세 데이터 가져오기
  @override
  Future<MovieDetailDto?> fetchMovieDetail(int id) async {
    String url = 'https://api.themoviedb.org/3/movie/$id?language=ko-KR';
    final response = await dio.get(url);

    final movieDetailDto = MovieDetailDto.fromJson(response.data);
    return movieDetailDto;
  }

  /// 영화 인기순 데이터 가져오기
  @override
  Future<MoviePopularSearchTopDto?> fetchPopularMovies() async {
    String url =
        'https://api.themoviedb.org/3/movie/popular?language=ko-KR&page=1';
    final response = await dio.get(url);

    final movieResponseDto = MoviePopularSearchTopDto.fromJson(response.data);
    return movieResponseDto;
  }

  /// 영화 평점 높은순 데이터 가져오기
  @override
  Future<MoviePopularSearchTopDto?> fetchTopRatedMovies() async {
    String url =
        'https://api.themoviedb.org/3/movie/top_rated?language=ko-KR&page=1';
    final response = await dio.get(url);

    final movieResponseDto = MoviePopularSearchTopDto.fromJson(response.data);
    return movieResponseDto;
  }

  /// 영화 개봉예정 데이터 가져오기
  @override
  Future<MovieNowUpcommingDto?> fetchUpcomingMovies() async {
    String url =
        'https://api.themoviedb.org/3/movie/upcoming?language=ko-KR&page=1';
    final response = await dio.get(url);

    final movieResponseDto = MovieNowUpcommingDto.fromJson(response.data);
    return movieResponseDto;
  }

  /// 영화 제목으로 데이터 가져오기
  @override
  Future<MoviePopularSearchTopDto?> fetchMovieSearch(String query) async {
    String url = 'https://api.themoviedb.org/3/search/movie?query=$query&language=ko-KR&page=1';
    final response = await dio.get(url);

    final movieResponseDto = MoviePopularSearchTopDto.fromJson(response.data);
    return movieResponseDto;
  }
}
