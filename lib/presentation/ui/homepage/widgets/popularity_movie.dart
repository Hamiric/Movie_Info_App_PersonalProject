import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/poster_url.dart';

class PopularityMovie extends StatelessWidget {
  const PopularityMovie({super.key, this.homeState});

  final homeState;

  @override
  Widget build(BuildContext context) {
    List<Movie>? movie = homeState.popularMovies;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: List.generate(
            movie?.length ?? 10,
            (index) {
              String tag = 'popular_$index';
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: GestureDetector(
                      onTap: () {
                        if (movie != null) {
                          Map<String, dynamic> extra = {
                            "tag": tag,
                            "id": movie[index].id,
                            "poster": movie[index].posterPath,
                          };
                          context.go('/post/', extra: extra);
                        }
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
                                    image: NetworkImage(posterUrl(
                                        posterUrl(movie[index].posterPath))),
                                    fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: movie == null
                              ? Center(child: CircularProgressIndicator())
                              : null,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          fontSize: 68,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
