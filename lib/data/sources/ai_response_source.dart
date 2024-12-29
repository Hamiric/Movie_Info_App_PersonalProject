import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:movie_info_app_personalproject/data/models/ai_response_dto.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';

abstract interface class AiResponseSource {
  Future<AiResponseDto?> getAiResponse(String content, Env env);
}

class AiResponseSourceImpl implements AiResponseSource {
  AiResponseSourceImpl();

  /// AI 응답 가져오기
  @override
  Future<AiResponseDto?> getAiResponse(String prompt, Env env) async {
    final generationConfig = GenerationConfig(
      temperature: 1.0,
      topP: 1.0,
      topK: 50,
    );
    
    final model = GenerativeModel(
        model: 'gemini-1.5-flash',
        apiKey: env.getKey('GEMINI_API_KEY')!,
        generationConfig: generationConfig);

    final content = [Content.text(prompt)];

    final response = await model.generateContent(content);
    return AiResponseDto(responseText: response.text);
  }
}
