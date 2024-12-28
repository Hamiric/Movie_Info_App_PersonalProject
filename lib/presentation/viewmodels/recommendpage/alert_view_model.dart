import 'package:flutter_riverpod/flutter_riverpod.dart';

class AlertState {
  int currentPageIndex;
  int maxPageLength;
  List<String> explanation;
  List<String> imgUrl;

  AlertState(
      this.currentPageIndex, this.maxPageLength, this.explanation, this.imgUrl);

  AlertState copyWith({
    int? currentPageIndex,
    int? maxPageLength,
    List<String>? explanation,
    List<String>? imgUrl,
  }) =>
      AlertState(
          currentPageIndex ?? this.currentPageIndex,
          maxPageLength ?? this.maxPageLength,
          explanation ?? this.explanation,
          imgUrl ?? this.imgUrl);
}

class AlertViewModel extends AutoDisposeNotifier<AlertState> {
  @override
  AlertState build() {
    List<String> explanation = [
      '추천받고 싶은 영화와 \n관련될것 같은 태그를 추가합니다.',
      '추천받기를 눌러 \nAI한테 영화를 추천받아 보세요!',
    ];

    List<String> imgUrl = [
      '',
      '',
    ];

    return AlertState(0, explanation.length, explanation, imgUrl);
  }

  /// 페이지 앞으로
  void nextPage() {
    if (state.currentPageIndex != (state.maxPageLength - 1)) {
      state = state.copyWith(currentPageIndex: state.currentPageIndex + 1);
    }
  }

  /// 페이지 뒤로
  void beforePage() {
    if (state.currentPageIndex != 0) {
      state = state.copyWith(currentPageIndex: state.currentPageIndex - 1);
    }
  }
}

final alertViewModelProvier =
    AutoDisposeNotifierProvider<AlertViewModel, AlertState>(() {
  return AlertViewModel();
});
