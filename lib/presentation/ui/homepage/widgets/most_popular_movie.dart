import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MostPopularMovie extends StatelessWidget {
  const MostPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    String tag = 'most_popular';
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: (){
            context.go('/post/', extra: tag);
          },
          child: Container(
            height: 540,
            decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ),
    );
  }
}
