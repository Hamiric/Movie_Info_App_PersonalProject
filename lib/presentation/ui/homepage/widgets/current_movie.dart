import 'package:flutter/material.dart';

class CurrentMovie extends StatelessWidget {
  const CurrentMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(20, (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            height: 180,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(8)
            ),
          ),
        )),
      ),
    );
  }
}
