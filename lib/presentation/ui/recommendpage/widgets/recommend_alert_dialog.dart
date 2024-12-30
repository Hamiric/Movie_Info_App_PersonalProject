import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/presentation/viewmodels/recommendpage/alert_view_model.dart';

class RecommendAlertDialog extends StatelessWidget {
  const RecommendAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final alertState = ref.watch(alertViewModelProvier);
        return AlertDialog(
          title: Center(child: Text('AI 에게 추천받기')),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 240,
                height: 300,
                decoration: BoxDecoration(
                  // color: Colors.white,
                  image: DecorationImage(image: AssetImage(alertState.imgUrl[alertState.currentPageIndex]),fit: BoxFit.contain)
                  // assetimage
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: 240,
                  child: Text(
                    alertState.explanation[alertState.currentPageIndex],
                    style: TextStyle(fontSize: 16),
                  )),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(alertViewModelProvier.notifier).beforePage();
                  },
                  color: alertState.currentPageIndex == 0
                      ? Colors.grey[800]
                      : null,
                  icon: Icon(Icons.navigate_before),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text('확인'),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      ref.read(alertViewModelProvier.notifier).nextPage();
                    },
                    color: alertState.currentPageIndex ==
                            (alertState.maxPageLength - 1)
                        ? Colors.grey[800]
                        : null,
                    icon: Icon(Icons.navigate_next)),
              ],
            ),
          ],
        );
      },
    );
  }
}
