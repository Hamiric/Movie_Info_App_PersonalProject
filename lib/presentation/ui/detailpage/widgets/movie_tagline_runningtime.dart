import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';

class MovieTaglineRunningtime extends StatelessWidget {
  const MovieTaglineRunningtime({super.key, this.detailState});

  final detailState;

  @override
  Widget build(BuildContext context) {
    MovieDetail movie = detailState.movieDetail;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(movie.tagline),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text('${movie.runtime}분'),
        ),
      ],
    );
  }
}
