import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:note_app_with_cubit/core/utils/Assets.dart';

class Loader extends StatelessWidget {
  const Loader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(100),
          child: LottieBuilder.asset(Asset_App.Loader),
        ),
      ),
      color: Colors.white.withOpacity(0.7),
    );
  }
}
