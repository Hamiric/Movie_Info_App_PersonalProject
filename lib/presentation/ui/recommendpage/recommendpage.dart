import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/presentation/ui/recommendpage/widgets/recommend_alert_dialog.dart';
import 'package:movie_info_app_personalproject/presentation/ui/recommendpage/widgets/recommend_button.dart';
import 'package:movie_info_app_personalproject/presentation/ui/recommendpage/widgets/recommend_tag_box.dart';
import 'package:movie_info_app_personalproject/presentation/viewmodels/recommendpage/recommend_view_model.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/reponsiveview.dart';

class Recommendpage extends StatelessWidget {
  const Recommendpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final recommendState = ref.watch(recommendViewModelProvider);

        return ReponsiveView(
          mobile: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('AI의 영화 추천'),
              backgroundColor: Colors.transparent,
              scrolledUnderElevation: 0,
              actions: [
                IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => RecommendAlertDialog(),
                          barrierDismissible: false);
                    },
                    icon: Icon(Icons.help_outline_outlined)
                ),
                SizedBox(width: 8,),
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  RecommendTagBox(recommendState: recommendState),
                  SizedBox(
                    height: 16,
                  ),
                  RecommendButton(recommendState: recommendState),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
