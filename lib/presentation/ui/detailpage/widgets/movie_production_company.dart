import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/domain/entities/movie_detail_entitiy.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/poster_url.dart';

class MovieProductionCompany extends StatelessWidget {
  const MovieProductionCompany({super.key, this.detailState});

  final detailState;

  @override
  Widget build(BuildContext context) {
    MovieDetail movie = detailState.movieDetail;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: List.generate(movie.productionCompanyLogos.length, (index) {
            return movie.productionCompanyLogos[index] == 'null'
                ? SizedBox.shrink()
                : Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Container(
                      width: 180,
                      height: 100,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Opacity(
                            opacity: 0.9,
                            child: Image.network(
                                posterUrl(movie.productionCompanyLogos[index]),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  );
          }),
        ),
      ),
    );
  }
}
