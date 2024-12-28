import 'package:movie_info_app_personalproject/data/repositories/ai_response_repository_impl.dart';
import 'package:movie_info_app_personalproject/domain/entities/ai_response_entitiy.dart';

class AiResponseUsecase {
  final env;

  AiResponseUsecase(this.env);

  /// AI 응답 가져오기
  Future<AiResponseEntitiy?> getAiResponse(String content) async {
    final aiResponseRepository = AiResponseRepositoryImpl();
    return await aiResponseRepository.getAiResponse(content, env);
  }
}