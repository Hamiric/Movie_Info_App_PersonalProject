import 'package:flutter/material.dart';
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
          pageBuilder: (context, state) => slideTransition(Detailpage(tag: state.extra,)),
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


/// 페이지 슬라이드 효과
CustomTransitionPage slideTransition(Widget page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
      position: animation.drive(
        Tween<Offset>(
          begin: const Offset(1.25, 0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeIn)),
      ),
      child: child,
    ),
  );
}
