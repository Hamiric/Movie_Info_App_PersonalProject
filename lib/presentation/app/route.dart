import 'package:go_router/go_router.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/detailpage.dart';
import 'package:movie_info_app_personalproject/presentation/ui/homepage/homepage.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homepage(),
      routes: [
        GoRoute(
          path: 'post',
          builder: (context, state) => const Detailpage(),
        )
      ],
    ),
  ],
  initialLocation: '/',

  /*
  errorBuilder: (context, state) {
    return const ErrorPage();
  }
  */
);
