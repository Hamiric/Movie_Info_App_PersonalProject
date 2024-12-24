import 'package:flutter/material.dart';

class MovieTaglineRunningtime extends StatelessWidget {
  const MovieTaglineRunningtime({super.key, this.tagLine, this.runningTime});

  final tagLine;
  final runningTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(tagLine),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text('$runningTime분'),
        ),
      ],
    );
  }
}
