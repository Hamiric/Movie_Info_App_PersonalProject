import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, this.aiState});

  final aiState;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(
          value: aiState.progress,
        ),
        SizedBox(
          height: 4,
        ),
        Text(aiState.progresslog[aiState.progressIndex]),
      ],
    );
  }
}
