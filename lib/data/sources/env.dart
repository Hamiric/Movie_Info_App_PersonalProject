import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  final String envfile = '.env';

  Env();

  /// env파일 로드
  Future<void> loadEnv() async {
    await dotenv.load(fileName: envfile);
  }

  /// key 값 나오게 하기
  String? getKey(String key) {
    return dotenv.env[key];
  }
}