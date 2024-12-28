import 'package:flutter_riverpod/flutter_riverpod.dart';

class AiState {
  List<String>? customTag;

  double progress;
  List<String> progresslog;
  int progressIndex;

  AiState(this.progress, this.customTag, this.progresslog, this.progressIndex);

  AiState copyWith({
    List<String>? customTag,

    double? progress,
    List<String>? progresslog,
    int? progressIndex,
  }) =>
      AiState(progress ?? this.progress, customTag ?? this.customTag, progresslog ?? this.progresslog, progressIndex ?? this.progressIndex);
}

class AiViewModel extends AutoDisposeNotifier<AiState> {
  @override
  AiState build() {
    List<String> progresslog = [
      'AI 추천을 기다리는중...',
      '추천영화들의 데이터를 가져오는중...',
      '완료'
    ];
    return AiState(0, null, progresslog, 0);
  }

  /// 추천페이지에서 Tag 리스트 받기
  void setData(List<String> data) {
    final customTag = List<String>.from(data);
    state = state.copyWith(customTag: customTag);
  }

  /// 진행바 올리기
  void addProgress() {
    double progress = state.progress;
    int progressIndex = state.progressIndex;

    if (state.progress < 1.0) {
      progress += 0.5;
      progressIndex ++;
    }
    state = state.copyWith(progress: progress, progressIndex: progressIndex);
  }
}

final aiViewModelProvider =
    AutoDisposeNotifierProvider<AiViewModel, AiState>(() {
  return AiViewModel();
});
