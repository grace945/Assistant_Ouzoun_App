import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class LoadingAnimationWidget extends StatelessWidget {
  const LoadingAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        'assets/animations/Animation - 1740348375718.json',
        fit: BoxFit.cover,
        repeat: true,
        height: 150,
        width: 150,
      ),
    );
  }
}