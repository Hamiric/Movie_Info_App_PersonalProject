import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';

class MovieNameOpentime extends StatelessWidget {
  const MovieNameOpentime({super.key, this.detailState});

  final detailState;

  @override
  Widget build(BuildContext context) {
    MovieDetail movie = detailState.movieDetail;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Spacer(),
          Text(movie.releaseDate),
        ],
      ),
    );
  }
}