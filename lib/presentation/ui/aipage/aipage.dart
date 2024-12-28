import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_info_app_personalproject/presentation/ui/aipage/widgets/progress_bar.dart';
import 'package:movie_info_app_personalproject/presentation/viewmodels/aipage/ai_view_model.dart';
import 'package:movie_info_app_personalproject/presentation/widgets/reponsiveview.dart';

class Aipage extends ConsumerStatefulWidget {
  const Aipage({super.key, this.extra});

  final extra;

  @override
  ConsumerState<Aipage> createState() => _AipageState();
}

class _AipageState extends ConsumerState<Aipage> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(aiViewModelProvider.notifier).setData(widget.extra);
      ref.read(aiViewModelProvider.notifier).aiResponse();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final aiState = ref.watch(aiViewModelProvider);
    return ReponsiveView(
        mobile: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // 진행바
            ProgressBar(aiState: aiState),
            // 결과 화면
            SizedBox(
              height: 16,
            ),
            aiState.progress != 1.0
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : Column()
          ],
        ),
      ),
    ));
  }
}
