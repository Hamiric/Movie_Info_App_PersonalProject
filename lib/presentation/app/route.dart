import 'package:go_router/go_router.dart';
import 'package:movie_info_app_personalproject/presentation/ui/homepage/homepage.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Homepage(),
      // routes: [],
    ),
  ],

  initialLocation: '/',

  /*
  errorBuilder: (context, state) {
    return const ErrorPage();
  }
  */
);
