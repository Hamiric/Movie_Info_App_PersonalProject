import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_entity.dart';
import 'package:movie_info_app_personalproject/presentation/viewmodels/aipage/ai_view_model.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/poster_url.dart';

class ResponseWindow extends StatelessWidget {
  const ResponseWindow({super.key, this.aiState});

  final aiState;

  @override
  Widget build(BuildContext context) {
    String tag = 'ai';
    List<Movie>? movie = aiState.searchMovies;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Hero(
            tag: tag,
            child: GestureDetector(
              onTap: () {
                if (movie != null) {
                  Map<String, dynamic> extra = {
                    "tag": tag,
                    "id": movie[aiState.index].id,
                    "poster": movie[aiState.index].posterPath,
                  };
                  context.go('/ai/post', extra: extra);
                }
              },
              child: Container(
                height: 540,
                decoration: BoxDecoration(
                  image: movie == null
                      ? null
                      : DecorationImage(
                          image: NetworkImage(
                              posterUrl(movie[aiState.index].posterPath)),
                          fit: BoxFit.cover),
                ),
                child: movie == null
                    ? Center(child: CircularProgressIndicator())
                    : null,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI의 추천 이유',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                  height: 85,
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      child: Text(
                          aiState.response.recommendMovies[aiState.index].reason),
                    ),
                  )),
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Consumer(
            builder: (context, ref, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        ref.read(aiViewModelProvider.notifier).beforePage();
                      },
                      icon: Icon(
                        Icons.navigate_before,
                        color: aiState.index == 0 ? Colors.grey[800] : null,
                      )),
                  Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${aiState.index + 1}',
                          style: TextStyle(fontSize: 16),
                        ),
                      )),
                  IconButton(
                      onPressed: () {
                        ref.read(aiViewModelProvider.notifier).nextPage();
                      },
                      icon: Icon(
                        Icons.navigate_next,
                        color: aiState.index == 4 ? Colors.grey[800] : null,
                      )),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
