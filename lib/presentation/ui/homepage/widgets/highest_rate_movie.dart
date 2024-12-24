import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HighestRateMovie extends StatelessWidget {
  const HighestRateMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(20, (index) {
          String tag = 'highestrage_$index';
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                context.go('/post/', extra: tag);
              },
              child: Hero(
                tag: tag,
                child: Container(
                  height: 180,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.red[200],
                      borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
