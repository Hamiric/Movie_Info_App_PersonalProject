import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app_personalproject/data/models/ai_response_dto.dart';
import 'package:movie_info_app_personalproject/data/sources/ai_response_source.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';

void main() {
  test('AI RESPONSE TEST', () async {
    final env = Env();
    await env.loadEnv();
    AiResponseSource aiResponseSource = AiResponseSourceImpl();

    final prompt = """
다음 태그에 해당되는 영화 5개를 추천해줘.
#코미디 #시간여행

답변은 json형식으로, title값은 영어로만, reason값은 한글로 이 영화를 왜 추천하는지를 100자 이내로 넣어줘.
예시는 다음과 같아.
{
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
}
""";

    AiResponseDto? aiResponseDto =
        await aiResponseSource.getAiResponse(prompt, env);

    print(aiResponseDto!.responseText);
  });
}
