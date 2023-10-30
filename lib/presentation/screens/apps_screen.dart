import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AppsPage extends StatelessWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset('assets/animations/animation.json'),
    );
  }
}
