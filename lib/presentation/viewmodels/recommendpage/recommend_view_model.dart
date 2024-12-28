import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendState {
  List<String> defaultTag;
  List<String> customTag;
  int maxTag;
  bool isInput;
  TextEditingController controller;

  RecommendState(this.defaultTag, this.customTag, this.maxTag, this.isInput,
      this.controller);

  RecommendState copyWith({
    List<String>? defaultTag,
    List<String>? customTag,
    int? maxTag,
    bool? isInput,
    TextEditingController? controller,
  }) =>
      RecommendState(
          defaultTag ?? this.defaultTag,
          customTag ?? this.customTag,
          maxTag ?? this.maxTag,
          isInput ?? this.isInput,
          controller ?? this.controller);
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

    ref.onDispose((){
      state.controller.dispose();
    });

    return RecommendState(defaultTag, [], 5, false, TextEditingController());
  }

  /// 태그 추가하기
  void addTag(String tag) {
    if (!state.customTag.any((element) => element == tag) &&
        state.customTag.length < state.maxTag) {
      List<String> customTag = List<String>.from(state.customTag);
      customTag.add(tag);

      state = state.copyWith(customTag: customTag, isInput: false);
    }
  }

  /// 태그 삭제하기
  void deleteTag(String tag) {
    List<String> customTag = List<String>.from(state.customTag);
    customTag.remove(tag);

    state = state.copyWith(customTag: customTag, isInput: false);
  }

  /// 커스텀 태그를 입력중인 상태
  void isInputState() {
    state.controller.text = '  ';
    state = state.copyWith(isInput: true);
  }

  /// 더이상 커스텀 태그를 입력중인 상태가 아님
  void isNotInputState() {
    state.controller.text = '';
    state = state.copyWith(isInput: false);
  }
  
}

final recommendViewModelProvider =
    AutoDisposeNotifierProvider<RecommendViewModel, RecommendState>(() {
  return RecommendViewModel();
});
