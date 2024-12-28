import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/presentation/viewmodels/recommendpage/recommend_view_model.dart';

class RecommendTagBox extends StatelessWidget {
  const RecommendTagBox({super.key, this.recommendState});

  final recommendState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            '추천 태크',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            height: 156,
            width: double.maxFinite,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(recommendState.defaultTag.length,
                        (index) {
                      return defaultTagBox(recommendState.defaultTag[index]);
                    }),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 32,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Text(
            '추천받을 영화의 태그 입력  (${recommendState.customTag.length} / ${recommendState.maxTag})',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            width: double.maxFinite,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children:
                    List.generate(recommendState.customTag.length + 1, (index) {
                  if (recommendState.customTag.length == 0) {
                    return plusBox('+', recommendState);
                  } else {
                    if (index == recommendState.customTag.length) {
                      if(index == recommendState.maxTag){
                        return SizedBox.shrink();
                      }
                      return plusBox('+', recommendState);
                    }
                    return tagBox(recommendState.customTag[index]);
                  }
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget defaultTagBox(String tag) {
    return Consumer(
      builder: (context, ref, child) {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              ref.read(recommendViewModelProvider.notifier).addTag(tag);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Center(
                    child: Text(
                  '# $tag',
                  style: TextStyle(color: Colors.blue),
                )),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget tagBox(String tag) {
    return Consumer(
      builder: (context, ref, child) {
        return IntrinsicWidth(
          child: GestureDetector(
            onTap: () {
              ref.read(recommendViewModelProvider.notifier).deleteTag(tag);
            },
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
                    SizedBox(
                      width: 8,
                    ),
                    Text('X'),
                  ],
                )),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget plusBox(String tag, var recommendState) {
    return Consumer(
      builder: (context, ref, child) {
        return IntrinsicWidth(
          child: recommendState.isInput == false
              ? GestureDetector(
                  onTap: () {
                    ref.read(recommendViewModelProvider.notifier).isInputState();
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Center(
                          child: Text(
                        '  $tag  ',
                        style: TextStyle(color: Colors.blue),
                      )),
                    ),
                  ),
                )
              : Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                        child: TextField(
                          controller: recommendState.controller,
                          maxLength: 20,
                          maxLines: 1,
                          onSubmitted: (value) {
                            if(recommendState.controller.text.trim() == ''){
                              ref.read(recommendViewModelProvider.notifier).isNotInputState();
                              return;
                            }
                            ref.read(recommendViewModelProvider.notifier).addTag(recommendState.controller.text);
                            ref.read(recommendViewModelProvider.notifier).isNotInputState();
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣]')),
                          ],
                    )),
                  ),
                ),
        );
      },
    );
  }
}
