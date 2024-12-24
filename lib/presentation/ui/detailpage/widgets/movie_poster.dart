import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, this.tag});

  final tag;

  @override
  Widget build(BuildContext context) {
    print(tag);
    return Hero(
      tag: tag,
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          color: Colors.blue[200]
        ),
      ),
    );
  }
}