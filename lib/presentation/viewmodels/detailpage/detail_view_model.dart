import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/usecase/movie_usecase.dart';

class DetailState {
  bool isLoading;
  Dio? dio;
  MovieDetail? movieDetail;

  DetailState(this.isLoading, this.dio, this.movieDetail);

  DetailState copyWith({
    bool? isLoading,
    Dio? dio,
    MovieDetail? movieDetail,
  }) => DetailState(isLoading ?? this.isLoading, dio ?? this.dio, movieDetail ?? this.movieDetail);
}

class DetailViewModel extends AutoDisposeNotifier<DetailState>{
  @override
  DetailState build() {
    return DetailState(false, null, null);
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

  /// id에 매칭된 영화 데이터 읽어오기
  Future<void> setData(int id) async {
    final movieUsecase = MovieUsecase(state.dio);
    MovieDetail? movieDetail = await movieUsecase.fetchMovieDetail(id);

    state = state.copyWith(isLoading: true, movieDetail: movieDetail);
  }
}

final detailViewModelProvider = AutoDisposeNotifierProvider<DetailViewModel,DetailState>((){
  return DetailViewModel();
});