import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class GlassyContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  const GlassyContainer({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.borderRadius,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? CustomSpacer.space12.all,
      margin: margin ?? CustomSpacer.space8.all,
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(20),
        borderRadius: borderRadius ?? BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withAlpha(50), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(25),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: child,
    );
  }
}
