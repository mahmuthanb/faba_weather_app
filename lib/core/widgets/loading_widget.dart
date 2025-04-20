import 'package:faba_weather_app/core/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.black54,
      child: Center(
        child: Lottie.asset(
          AppImages.loading,
          width: size.width * 0.75,
          height: size.height * 0.75,
        ),
      ),
    );
  }
}
