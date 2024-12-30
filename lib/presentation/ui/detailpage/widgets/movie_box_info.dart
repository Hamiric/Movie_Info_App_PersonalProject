import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';

class MovieBoxInfo extends StatelessWidget {
  const MovieBoxInfo({super.key, this.detailState});

  final detailState;

  @override
  Widget build(BuildContext context) {
    MovieDetail movie = detailState.movieDetail;
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: [
            Box('${movie.voteAverage}', '평점'),
            SizedBox(width: 8),
            Box('평점투표수', '${movie.voteCount}'),
            SizedBox(width: 8),
            Box('${movie.popularity}', '인기점수'),
            SizedBox(width: 8),
            Box('${movie.budget}', '예산'),
            SizedBox(width: 8),
            Box('${movie.revenue}', '수익'),
            SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  Widget Box(String up, String down) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(up),
            Text(down),
          ],
        ),
      ),
    );
  }
}
