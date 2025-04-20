import 'package:faba_weather_app/core/constants/app_colors.dart';
import 'package:faba_weather_app/presentation/widgets/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  const ShimmerPlaceholder({super.key, this.isGlassy = false});

  final bool isGlassy;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.primaryDark,
      highlightColor: AppColors.textColor,
      child: (isGlassy) ? GlassyContainer(child: Container()) : Container(),
    );
  }
}
