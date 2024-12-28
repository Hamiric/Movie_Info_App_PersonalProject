import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_info_app_personalproject/presentation/viewmodels/recommendpage/recommend_view_model.dart';

class RecommendConfirmAlert extends StatelessWidget {
  const RecommendConfirmAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final recommendState = ref.watch(recommendViewModelProvider);
        return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                    child: Text(
                  '정말로 이 태그로 추천받겠습니까?',
                  style: TextStyle(fontSize: 16),
                )),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: recommendState.customTag.isEmpty
                      ? [tagBox('무작위')]
                      : List.generate(recommendState.customTag.length, (index) {
                          return tagBox(recommendState.customTag[index]);
                        }),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text('취소'),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final data = List<String>.from(recommendState.customTag);
                      context.go('/ai', extra: data);
                    },
                    child: Center(
                      child: Text('확인'),
                    ),
                  ),
                ],
              )
            ]);
      },
    );
  }

  Widget tagBox(String tag) {
    return IntrinsicWidth(
        child: Container(
      height: 40,
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
            child: Row(
          children: [
            Text(
              '# $tag',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        )),
      ),
    ));
  }
}
