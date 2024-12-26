import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/presentation/ui/homepage/widgets/current_movie.dart';
import 'package:movie_info_app_personalproject/presentation/ui/homepage/widgets/highest_rate_movie.dart';
import 'package:movie_info_app_personalproject/presentation/ui/homepage/widgets/most_popular_movie.dart';
import 'package:movie_info_app_personalproject/presentation/ui/homepage/widgets/popularity_movie.dart';
import 'package:movie_info_app_personalproject/presentation/ui/homepage/widgets/upcomming_move.dart';
import 'package:movie_info_app_personalproject/presentation/viewmodels/homepage/home_view_model.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/reponsiveview.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {        
        final homeState = ref.watch(homeViewModelProvider);
        ref.read(homeViewModelProvider.notifier).setDio().then((_){
          ref.read(homeViewModelProvider.notifier).setData();
        });
        return ReponsiveView(
          mobile: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 24, left: 24),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Text('가장 인기있는', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 16,),
                    MostPopularMovie(),
                    SizedBox(height: 16,),
                    Text('현재 상영중', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    CurrentMovie(),
                    SizedBox(height: 16,),
                    Text('인기순', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    PopularityMovie(),
                    SizedBox(height: 16,),
                    Text('평점 높은 순', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    HighestRateMovie(),
                    SizedBox(height: 16,),
                    Text('개봉 예정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 8,),
                    UpcommingMove(),
                    SizedBox(height: 24,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
