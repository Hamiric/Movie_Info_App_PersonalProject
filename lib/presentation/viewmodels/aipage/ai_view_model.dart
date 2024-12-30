import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/domain/entities/ai_response_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';
import 'package:movie_info_app_personalproject/domain/usecase/ai_response_usecase.dart';
import 'package:movie_info_app_personalproject/domain/usecase/movie_usecase.dart';

class AiState {
  List<String>? customTag;

  double progress;
  List<String> progresslog;
  int progressIndex;

  AiResponseEntitiy? response;

  List<Movie>? searchMovies;
  int index;

  AiState(this.progress, this.customTag, this.progresslog, this.progressIndex,
      this.response, this.searchMovies, this.index);

  AiState copyWith({
    List<String>? customTag,
    double? progress,
    List<String>? progresslog,
    int? progressIndex,
    AiResponseEntitiy? response,
    List<Movie>? searchMovies,
    int? index,
  }) =>
      AiState(
          progress ?? this.progress,
          customTag ?? this.customTag,
          progresslog ?? this.progresslog,
          progressIndex ?? this.progressIndex,
          response ?? this.response,
          searchMovies ?? this.searchMovies,
          index ?? this.index);
}

class AiViewModel extends AutoDisposeNotifier<AiState> {
  @override
  AiState build() {
    List<String> progresslog = [
      'AI 추천을 기다리는중...',
      '추천영화들의 데이터를 가져오는중...',
      '완료',
      'AI 응답 문제, 다른 태그로 다시 시도해 보세요.',
      '영화검색 문제, 다른 태그로 다시 시도해 보세요.',
    ];
    return AiState(0, null, progresslog, 0, null, null, 0);
  }

  /// 추천페이지에서 Tag 리스트 받기
  void setData(List<String> data) {
    final customTag = List<String>.from(data);

    for(int i = 0 ; i < customTag.length ; i ++){
      log(customTag[i], name: 'tag');
    }

    state = state.copyWith(customTag: customTag);
  }

  /// 진행바 올리기
  void addProgress() {
    double progress = state.progress;
    int progressIndex = state.progressIndex;

    if (state.progress < 1.0) {
      progress += 0.5;
      progressIndex++;
    }
    state = state.copyWith(progress: progress, progressIndex: progressIndex);
  }

  /// 응답문제 발생시 실행될 코드
  /// problem 1 은 AI 응답문제
  /// problem 2 는 api 검색시 문제
  void problemProgress(int problem) {
    switch (problem) {
      case 1:
        state = state.copyWith(progress: 1.0, progressIndex: 3);
        break;
      case 2:
        state = state.copyWith(progress: 1.0, progressIndex: 4);
        break;
    }
  }

  /// Ai 응답 받기
  Future<void> aiResponse() async {
    try {
      final env = Env();
      await env.loadEnv();
      final aiResponseUsecase = AiResponseUsecase(env);

      String content = '';
      for (int i = 0; i < state.customTag!.length; i++) {
        if (i == 0) {
          content += '#${state.customTag![i]}';
        } else {
          content += ' #${state.customTag![i]}';
        }
      }
      state.response = await aiResponseUsecase.getAiResponse(content);
      for (int i = 0; i < state.response!.recommendMovies.length; i++) {
        log(state.response!.recommendMovies[i].title);
      }
      addProgress();
    } catch (e) {
      log('AI 응답 문제 $e');
      problemProgress(1);
    }
  }

  /// 제목으로 영화 검색
  Future<void> searchMovie() async {
    try {
      List<String> query = [];
      for (int i = 0; i < state.response!.recommendMovies.length; i++) {
        query.add(state.response!.recommendMovies[i].title);
      }

      final env = Env();
      await env.loadEnv();

      final options = BaseOptions(headers: {
        'Authorization': 'Bearer ${env.getKey('TMDB_ACCESS_TOKEN')}',
        'Accept': 'application/json',
      });

      final dio = Dio(options);

      final movieUsecase = MovieUsecase(dio);
      state.searchMovies = await movieUsecase.fetchMovieSearch(query);

      addProgress();
    } catch (e) {
      log('영화 검색시 문제 $e');
      problemProgress(2);
    }
  }

  /// 페이지 앞으로 넘김
  void nextPage() {
    if (state.index == (state.searchMovies!.length - 1)) {
      return;
    }
    int index = state.index + 1;
    state = state.copyWith(index: index);
  }

  /// 페이지 전으로 넘김
  void beforePage() {
    if (state.index == 0) {
      return;
    }
    int index = state.index - 1;
    state = state.copyWith(index: index);
  }
}

final aiViewModelProvider =
    AutoDisposeNotifierProvider<AiViewModel, AiState>(() {
  return AiViewModel();
});
