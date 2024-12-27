import 'package:flutter/material.dart';

class RecommendButton extends StatelessWidget {
  const RecommendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
            child: Text('추천받기')),
      ),
    );
  }
}
