import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_box_info.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_category.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_description.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_name_opentime.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_poster.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_production_company.dart';
import 'package:movie_info_app_personalproject/presentation/ui/detailpage/widgets/movie_tagline_runningtime.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key, this.tag});

  final tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          MoviePoster(tag: tag,),
          SizedBox(height: 16),
          MovieNameOpentime(movieName: 'Moana 2', openTime: DateTime.now()),
          SizedBox(height: 8),
          MovieTaglineRunningtime(
            tagLine: 'The Ocean is calling them back',
            runningTime: 100,
          ),
          SizedBox(height: 8),
          MovieCategory(
            category: ['Animation', 'Adventure', 'Family', 'Comedy'],
          ),
          MovieDescription(description: "After receiving an unexpected call from her wayfinding ancestors, Moana journeys alongside Maui and a new crew to the far seas of Oceansia and into dangerous, long-lost waters for an adventure unlike anything she's ever faced"),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text('흥행정보', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 16),
          MovieBoxInfo(info: {'평점':6949,'평점투표수':331,'인기점수':5466.535,'예산':150000000,'수익':423586580},),
          SizedBox(height: 16),
          MovieProductionCompany(companies: ['https://picsum.photos/140/100','https://picsum.photos/140/100'],),
          SizedBox(height: 24),
        ],
      )),
    );
  }
}
