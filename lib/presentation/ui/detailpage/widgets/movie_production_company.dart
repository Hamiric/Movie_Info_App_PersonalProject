import 'package:flutter/material.dart';

class MovieProductionCompany extends StatelessWidget {
  const MovieProductionCompany({super.key, this.companies});

  final companies;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(companies.length, (index)=> Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              color: Colors.white,
              child: Opacity(opacity: 0.9, child: Image.network(companies[index], fit: BoxFit.cover)),
            ),
          )),
        ),
      ),
    );
  }
}