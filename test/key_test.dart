import 'package:flutter_test/flutter_test.dart';
import 'package:movie_info_app_personalproject/data/sources/env.dart';

void main() {
  test('key_Test', () async {
    final env = Env();
    await env.loadEnv();

    expect(env.getKey('TEST_KEY'), '1234');
  });
}
