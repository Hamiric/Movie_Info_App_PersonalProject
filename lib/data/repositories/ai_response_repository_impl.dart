import 'dart:convert';

import 'package:movie_info_app_personalproject/data/sources/ai_response_source.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/domain/entities/ai_response_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/repositories/ai_response_repository.dart';

class AiResponseRepositoryImpl implements AiResponseRepository {

  /// AI 응답 가져오기
  Future<AiResponseEntitiy?> getAiResponse(String content, Env env) async {
    final aiResponseSource = AiResponseSourceImpl();

    final prompt = """
다음 태그에 해당되는 영화 5개를 추천해줘.
$content

답변은 json형식으로, title값은 영어로만, reason값은 한글로 이 영화를 왜 추천하는지를 200자 이내로 넣어줘.
reason마지막에는 ~이기 때문에 추천합니다. 로 끝맺음되어야 해.

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

    final res = response!.responseText!.split('#')[1];
    
    Map<String,dynamic> json = jsonDecode(res);
    return AiResponseEntitiy.fromJson(json);
  }
}
