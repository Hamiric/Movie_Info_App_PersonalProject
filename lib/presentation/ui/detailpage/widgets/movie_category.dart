import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';

class MovieCategory extends StatelessWidget {
  const MovieCategory({super.key, this.detailState});

  final detailState;

  @override
  Widget build(BuildContext context) {
    MovieDetail movie = detailState.movieDetail;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Row(
              children: List.generate(movie.genres.length, (index) { return Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(child: Text(movie.genres[index], style: TextStyle(color: Colors.blue),)),
                  ),
                ),
              );}),
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
