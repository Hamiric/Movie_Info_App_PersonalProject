import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/poster_url.dart';

class HighestRateMovie extends StatelessWidget {
  const HighestRateMovie({super.key, this.homeState});

  final homeState;

  @override
  Widget build(BuildContext context) {
    List<Movie>? movie = homeState.topRatedMovies;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(20, (index) {
          String tag = 'highestrage_$index';
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                context.go('/post/', extra: tag);
              },
              child: Hero(
                tag: tag,
                child: Container(
                  height: 180,
                  width: 120,
                  decoration: BoxDecoration(
                      image: movie == null
                          ? null
                          : DecorationImage(
                              image: NetworkImage(
                                  posterUrl(movie[index].posterPath)),
                              fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(8)),
                  child: movie == null
                      ? Center(child: CircularProgressIndicator())
                      : null,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
