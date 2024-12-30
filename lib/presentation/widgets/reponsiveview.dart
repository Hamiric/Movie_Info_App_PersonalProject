import 'package:flutter/material.dart';

class ReponsiveView extends StatelessWidget {
  final Widget? pc1024;
  final Widget? tablet768;
  final Widget? tablet600;
  final Widget? mobile480;
  final Widget mobile;

  const ReponsiveView({
    super.key,
    required this.mobile,
    this.mobile480,
    this.tablet600,
    this.tablet768,
    this.pc1024,
  });

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;

    if (deviceWidth >= 1024 && pc1024 != null) {
      return pc1024!;
    }
    if (deviceWidth >= 768 && tablet768 != null) {
      return tablet768!;
    }
    if (deviceWidth >= 600 && tablet600 != null) {
      return tablet600!;
    }
    if (deviceWidth >= 480 && mobile480 != null) {
      return mobile480!;
    }
    return mobile;
  }
}
