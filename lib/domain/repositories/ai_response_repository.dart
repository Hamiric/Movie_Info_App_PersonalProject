import 'package:movie_info_app_personalproject/data/sources/env.dart';
import 'package:movie_info_app_personalproject/domain/entities/ai_response_entitiy.dart';

abstract interface class AiResponseRepository {
  Future<AiResponseEntitiy?> getAiResponse(String content, Env env);
}