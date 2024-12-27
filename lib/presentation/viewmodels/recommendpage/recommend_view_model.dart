import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendState {
  List<String> defaultTag;
  List<String> customTag;
  int maxTag;

  RecommendState(this.defaultTag, this.customTag, this.maxTag);

  RecommendState copyWith({
    List<String>? defaultTag,
    List<String>? customTag,
    int? maxTag,
  }) =>
      RecommendState(
          defaultTag ?? this.defaultTag, customTag ?? this.customTag, maxTag ?? this.maxTag);
}

class RecommendViewModel extends AutoDisposeNotifier<RecommendState> {
  @override
  RecommendState build() {
    List<String> defaultTag = [
      '액션',
      '코미디',
      '드라마',
      'SF',
      '로맨스',
      '스릴러',
      '공포',
      '애니메이션',
      '다큐멘터리',
      '판타지',
      '전쟁',
      '범죄',
      '감동적인',
      '웃긴',
      '긴장감 넘치는',
      '몽환적인',
      '어두운',
      '따뜻한',
      '힐링',
      '철학적',
      '슬픈',
      '신나는',
      '낭만적인',
      '무서운',
      '시간여행',
      '다중우주',
      '성장',
      '복수',
      '우정',
      '가족',
      '사랑',
      '음악',
      '예술',
      '생존',
      '인공지능',
      '외계인',
      '판타지 세계',
      '역사',
      '전쟁',
      '추리',
      '가족용',
      '어린이용',
      '청소년용',
      '성인용',
      '올드클래식',
      '예술영화',
      '블록버스터',
      '인디영화',
      '한국 영화',
      '일본 애니메이션',
      '할리우드',
      '유럽 영화',
      '아시아 영화',
      '흑백 영화',
      '80년대 영화',
      '실화 바탕',
      '1980년대 이전',
      '1980년대',
      '1990년대',
      '2000년대',
      '2010년대',
      '2020년대'
    ];

    return RecommendState(defaultTag, [], 10);
  }

  /// 태그 추가하기
  void addTag(String tag) {
    if (!state.customTag.any((element) => element == tag) && state.customTag.length < state.maxTag) {
      List<String> customTag = List<String>.from(state.customTag);
      customTag.add(tag);

      state = state.copyWith(customTag: customTag);
    }
  }

  /// 태그 삭제하기
  void deleteTag(String tag) {
    List<String> customTag = List<String>.from(state.customTag);
    customTag.remove(tag);

    state = state.copyWith(customTag: customTag);
  }
}

final recommendViewModelProvider =
    AutoDisposeNotifierProvider<RecommendViewModel, RecommendState>(() {
  return RecommendViewModel();
});
