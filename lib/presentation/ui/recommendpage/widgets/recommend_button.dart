import 'package:flutter/material.dart';

class RecommendButton extends StatelessWidget {
  const RecommendButton({super.key, this.recommendState});

  final recommendState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
            onPressed: () {
              if(!recommendState.isInput){
                print('버튼 클릭');
              }
            },
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            child: Text('추천받기')),
      ),
    );
  }
}
