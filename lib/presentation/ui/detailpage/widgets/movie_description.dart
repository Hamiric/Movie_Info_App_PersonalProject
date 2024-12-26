import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';

class MovieDescription extends StatelessWidget {
  const MovieDescription({super.key, this.detailState});

  final detailState;

  @override
  Widget build(BuildContext context) {
    MovieDetail movie = detailState.movieDetail;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            movie.overview,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
