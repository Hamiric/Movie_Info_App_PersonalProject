import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app_personalproject/data/repositories/ai_response_repository_impl.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/domain/entities/ai_response_entitiy.dart';
import 'package:movie_info_app_personalproject/domain/repositories/ai_response_repository.dart';

void main() {
  test('AI RESPONSE REPOSITORY TEST', () async {
    final env = Env();
    await env.loadEnv();
    AiResponseRepository aiResponseRepository = AiResponseRepositoryImpl();

    final prompt = '#공포 #스릴러';

    AiResponseEntitiy? a = await aiResponseRepository.getAiResponse(prompt, env);

    print(a!.recommendMovies[0].title);
    print(a!.recommendMovies[1].title);
  });
}
