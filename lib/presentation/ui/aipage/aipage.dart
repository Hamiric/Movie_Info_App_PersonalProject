import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/presentation/ui/aipage/widgets/progress_bar.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/reponsiveview.dart';

class Aipage extends ConsumerStatefulWidget {
  const Aipage({super.key, this.extra});

  final extra;

  @override
  ConsumerState<Aipage> createState() => _AipageState();
}

class _AipageState extends ConsumerState<Aipage> {
  @override
  Widget build(BuildContext context) {
    return ReponsiveView(
        mobile: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 진행바
            ProgressBar(),
          ],
        ),
      ),
    ));
  }
}
