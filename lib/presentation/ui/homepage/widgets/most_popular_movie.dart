import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/poster_url.dart';

class MostPopularMovie extends StatelessWidget {
  const MostPopularMovie({super.key, this.homeState});

  final homeState;

  @override
  Widget build(BuildContext context) {
    String tag = 'most_popular';

    List<Movie>? movie = homeState.popularMovies;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: () {
            if (movie != null) {
              Map<String, dynamic> extra = {
                "tag": tag,
                "id": movie[0].id,
                "poster": movie[0].posterPath,
              };
              context.go('/post', extra: extra);
            }
          },
          child: Container(
            height: 540,
            decoration: BoxDecoration(
              image: movie == null
                  ? null
                  : DecorationImage(
                      image: NetworkImage(posterUrl(movie[0].posterPath)),
                      fit: BoxFit.cover),
            ),
            child: movie == null
                ? Center(child: CircularProgressIndicator())
                : null,
          ),
        ),
      ),
    );
  }
}
