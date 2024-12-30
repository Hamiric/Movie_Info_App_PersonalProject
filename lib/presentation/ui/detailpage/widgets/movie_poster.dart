import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/poster_url.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({super.key, this.tag, this.poster});

  final tag;
  final poster;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        height: 600,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(posterUrl(poster)),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
