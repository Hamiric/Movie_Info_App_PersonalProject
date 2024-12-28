import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
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
        if(!homeState.isLoading) {
          ref.read(homeViewModelProvider.notifier).setDio().then((_){
            ref.read(homeViewModelProvider.notifier).setData();
          });
        }
        return ReponsiveView(
          mobile: Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('가장 인기있는', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 16,),
                    MostPopularMovie(homeState: homeState),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('현재 상영중', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 8,),
                    CurrentMovie(homeState: homeState),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('인기순', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 8,),
                    PopularityMovie(homeState: homeState),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('평점 높은 순', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 8,),
                    HighestRateMovie(homeState: homeState),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('개봉 예정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 8,),
                    UpcommingMove(homeState: homeState),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: Text('추천 받기', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                    ),
                    SizedBox(height: 8,),
                    Center(
                      child: ElevatedButton(
                        onPressed: (){
                          context.go('/recommend/');
                        }, 
                        child: Text('AI 추천 영화 받아보기'),
                      ),
                    ),
                    SizedBox(height: 24,)
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
