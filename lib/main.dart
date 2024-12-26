import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/presentation/app/route.dart';
import 'package:movie_info_app_personalproject/presentation/theme/theme.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

// 해보고 싶은거
// 내부 DB 사용해서, Home 화면 전에 로딩화면만들고, 한번에 로딩한 후 사용하는거 해보고 싶음
// 중요한 것은, 이미 이전에 내부 DB에 저장한 내용이면, 다시 불러오는 방식이 되면 안된다는것!
// 그리고 전부 가져오는 것이 아니라 일부만 가져오고, 추가 요청이 가능한 방식으로!

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
      
      routerConfig: router,
    );
  }
}