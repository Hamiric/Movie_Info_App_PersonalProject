import 'dart:convert';
import 'dart:developer';

import 'package:movie_info_app_personalproject/data/sources/ai_response_source.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/domain/entities/ai_response_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/repositories/ai_response_repository.dart';

class AiResponseRepositoryImpl implements AiResponseRepository {

  /// AI 응답 가져오기
  @override
  Future<AiResponseEntitiy?> getAiResponse(String content, Env env) async {
    final aiResponseSource = AiResponseSourceImpl();

    final prompt = """
다음 태그에 해당되는 실제 존재하는 영화 5개를 추천해줘.

추천영화들은 반드시 아래의 조건을 만족해야해.
1. 실제 개봉된 영화여야 하며, 가상의 영화나 임의로 만들어낸 제목은 포함되지 않아야 함.
2. 추천은 **TMDB API**와 같은 신뢰할 수 있는 영화 데이터베이스를 기반으로 판단한 결과여야 하며, 추천된 영화의 제목은 반드시 **TMDB API에서 검색할 수 있는 실제 제목**이어야 함.
3. 태그가 영화와 명확히 관련되지 않거나, 의미 없는 문자열일 경우 해당 태그를 무시.
4. 입력된 태그가 없거나 입력된 모든 태그가 무효화된 경우, 영화 장르나 테마에 구애받지 않고 신뢰할 수 있는 데이터베이스를 기반으로 영화를 추천해야 함.
5. 가능하면 최신 영화를 우선적으로 추천하며, 태그와 관련된 영화가 최신작 중에서 존재하지 않을 경우에만 오래된 영화를 추천할 수 있음.
6. 입력된 태그가 너무 많을 경우, 모든 태그를 만족할 필요는 없음.

추천 영화들은 반드시 아래의 태그를 포함해야 해:
$content

**답변은 오직 JSON 형식으로만 작성해 줘.**
`title` 값은 연도가 포함되지 않은 영어 제목만, `reason` 값은 한글로 작성해줘. 
`reason`은 해당 영화를 추천하는 이유를 200자 이내로 서술하며, 마지막에 반드시 "~이기 때문에 추천합니다."로 끝내줘.

예시는 다음과 같아. 분리하기 쉽게 {} 양끝에 #을 붙여줘
#{
  recommend_movie: [
    {
      title: '추천영화1',
      reason: '추천하는 이유1'
    },
    {
      title: '추천영화2',
      reason: '추천하는 이유2'
    },
    ...
  ],
}#
""";

    final response = await aiResponseSource.getAiResponse(prompt, env);

    log(response!.responseText!, name: 'ai_response');
    final res = response.responseText!.split('#')[1];
    
    Map<String,dynamic> json = jsonDecode(res);
    return AiResponseEntitiy.fromJson(json);
  }
}
