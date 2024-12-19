import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/reponsiveview.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReponsiveView(
      mobile: Scaffold(
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Text('가장 인기있는'),
              // 가장 인기있는 - text
              // 영화 포스터 - Image
              // 현재 상영중 - text
              // 스크롤(가로) 가능한 영화 포스터들 - Row
              // 인기순 - text
              // 스크롤(가로) 가능한 영화 포스터들 - Row(Stack)
              // 평좀 높은순 - text
              // 스크롤(가로) 가능한 영화 포스터들 - Row
            ],
          ),
        ),
      ),
    );
  }
}
