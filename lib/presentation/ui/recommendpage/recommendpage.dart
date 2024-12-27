import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/presentation/ui/recommendpage/widgets/recommend_alert_dialog.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/reponsiveview.dart';

class Recommendpage extends StatelessWidget {
  const Recommendpage({super.key});

  @override
  Widget build(BuildContext context) {
    return ReponsiveView(
      mobile: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('GPT한테 영화 추천받기'),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => RecommendAlertDialog(),
                      barrierDismissible: false);
                },
                icon: Icon(Icons.help_outline_outlined))
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            // 태그박스
            // 추천받기 버튼
          ],
        )),
      ),
    );
  }
}
