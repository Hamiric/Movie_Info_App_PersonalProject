import 'package:flutter/material.dart';
import 'package:movie_info_app_personalproject/presentation/ui/recommendpage/widgets/recommend_confirm_alert.dart';

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
              if (!recommendState.isInput) {
                showDialog(
                  context: context,
                  builder: (context) => RecommendConfirmAlert(),
                  barrierDismissible: false,
                );
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
