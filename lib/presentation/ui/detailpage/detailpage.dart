import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_box_info.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_category.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_description.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_name_opentime.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_poster.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_production_company.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_tagline_runningtime.dart';
import 'package:movie_info_app_personalproject/presentation/viewmodels/detailpage/detail_view_model.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key, this.extra});

  final extra;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final detailState = ref.watch(detailViewModelProvider);
        if (!detailState.isLoading) {
          ref.read(detailViewModelProvider.notifier).setDio().then((_) {
            ref.read(detailViewModelProvider.notifier).setData(extra['id']);
          });
        }
        return Scaffold(
          body: SafeArea(
              child: ListView(children: [
            MoviePoster(
              tag: extra['tag'],
              poster: extra['poster'],
            ),
            SizedBox(height: 16),
            detailState.movieDetail == null
                ? Center(child: CircularProgressIndicator())
                : contentLoad(detailState),
          ])),
        );
      },
    );
  }

  Widget contentLoad(var detailState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieNameOpentime(detailState: detailState),
        SizedBox(height: 8),
        MovieTaglineRunningtime(
          detailState: detailState,
        ),
        SizedBox(height: 8),
        MovieCategory(
          detailState: detailState,
        ),
        MovieDescription(detailState: detailState),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            '흥행정보',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 16),
        MovieBoxInfo(
          detailState: detailState
        ),
        SizedBox(height: 16),
        MovieProductionCompany(
          detailState: detailState
        ),
        SizedBox(height: 24),
      ],
    );
  }
}
