import 'package:flutter/material.dart';

class PopularityMovie extends StatelessWidget {
  const PopularityMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          20,
          (index) => Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Container(
                  height: 180,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              Positioned(
                left: 0, 
                bottom: 0, 
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    fontSize: 68,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
