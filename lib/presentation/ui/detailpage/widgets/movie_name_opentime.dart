import 'package:flutter/material.dart';

class MovieNameOpentime extends StatelessWidget {
  const MovieNameOpentime({super.key, this.movieName, this.openTime});

  final movieName;
  final openTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(movieName, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Spacer(),
          Text('${openTime.year}-${openTime.month}-${openTime.day}'),
        ],
      ),
    );
  }
}