import 'package:flutter/material.dart';

class MostPopularMovie extends StatelessWidget {
  const MostPopularMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: Container(
        height: 540,
        decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
