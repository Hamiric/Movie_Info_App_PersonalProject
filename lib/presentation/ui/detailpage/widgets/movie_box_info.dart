import 'package:flutter/material.dart';

class MovieBoxInfo extends StatelessWidget {
  const MovieBoxInfo({super.key, this.info});

  final info;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Row(
          children: [
            Box('${info['평점']}', '평점'),
            SizedBox(width: 8),
            Box('평점투표수', '${info['평점투표수']}'),
            SizedBox(width: 8),
            Box('${info['인기점수']}', '인기점수'),
            SizedBox(width: 8),
            Box('${info['예산']}', '예산'),
            SizedBox(width: 8),
            Box('${info['수익']}', '수익'),
            SizedBox(width: 24),
          ],
        ),
      ),
    );
  }

  Widget Box(String up, String down) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(up),
            Text(down),
          ],
        ),
      ),
    );
  }
}
