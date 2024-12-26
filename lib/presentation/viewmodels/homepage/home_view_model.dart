import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';
import 'package:movie_info_app_personalproject/domain/usecase/movie_usecase.dart';

class HomeState {
  bool isLoading;
  Dio? dio;
  List<Movie>? nowPlayingMovies;
  List<Movie>? popularMovies;
  List<Movie>? topRatedMovies;
  List<Movie>? upcomingMovies;

  HomeState(this.isLoading, this.dio, this.nowPlayingMovies, this.popularMovies,
      this.topRatedMovies, this.upcomingMovies);

  HomeState copyWith({
    bool? isLoading,
    Dio? dio,
    List<Movie>? nowPlayingMovies,
    List<Movie>? popularMovies,
    List<Movie>? topRatedMovies,
    List<Movie>? upcomingMovies,
  }) =>
      HomeState(
          isLoading ?? this.isLoading,
          dio ?? this.dio,
          nowPlayingMovies ?? this.nowPlayingMovies,
          popularMovies ?? this.popularMovies,
          topRatedMovies ?? this.topRatedMovies,
          upcomingMovies ?? this.upcomingMovies);
}

class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(false, null, null, null, null, null);
  }

  /// Dio 세팅
  Future<void> setDio() async {
    final env = Env();
    await env.loadEnv();

    final options = BaseOptions(headers: {
      'Authorization': 'Bearer ${env.getKey('TMDB_ACCESS_TOKEN')}',
      'Accept': 'application/json',
    });

    final dio = Dio(options);
    state.dio = dio;
  }

  /// 데이터 읽어오기 (API 통신)
  Future<void> setData() async {
    final movieUsecase = MovieUsecase(state.dio);
    List<Movie>? nowPlayingMovies = await movieUsecase.fetchNowPlayingMovies();
    List<Movie>? popularMovies = await movieUsecase.fetchPopularMovies();
    List<Movie>? topRatedMovies = await movieUsecase.fetchTopRatedMovies();
    List<Movie>? upcomingMovies = await movieUsecase.fetchUpcomingMovies();

    state = state.copyWith(
        isLoading: true,
        nowPlayingMovies: nowPlayingMovies,
        popularMovies: popularMovies,
        topRatedMovies: topRatedMovies,
        upcomingMovies: upcomingMovies);
  }
}

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(() {
  return HomeViewModel();
});
