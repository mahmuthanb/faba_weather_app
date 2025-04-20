import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:faba_weather_app/core/enums/weather_condition.dart';

class WeatherAnimationContainer extends StatelessWidget {
  final String weatherCondition;
  final Widget child;

  const WeatherAnimationContainer({
    super.key,
    required this.weatherCondition,
    required this.child,
  });

  Color _getBackgroundColor() {
    return WeatherCondition.fromString(
      weatherCondition,
    ).backgroundColor.withAlpha(200);
  }

  Widget _buildWeatherAnimation(BuildContext context) {
    final condition = WeatherCondition.fromString(weatherCondition);

    // Base animation widget
    Widget animation = Lottie.asset(condition.animationPath, fit: BoxFit.cover);

    // Apply different effects based on weather condition
    switch (condition) {
      case WeatherCondition.rain:
        return Transform.rotate(
          angle: 0.1, // Slight tilt for rain
          child: Transform.scale(scale: 1.2, child: animation),
        );
      case WeatherCondition.snow:
        return Transform.rotate(
          angle: -0.05, // Slight tilt for snow
          child: Transform.scale(scale: 1.1, child: animation),
        );
      case WeatherCondition.thunderstorm:
        return Transform.scale(scale: 1.3, child: animation);
      case WeatherCondition.fog:
        return Transform.scale(
          scale: 1.4,
          child: Opacity(opacity: 0.5, child: animation),
        );
      default:
        return animation;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background color
        Container(color: _getBackgroundColor()),
        // Weather animation
        Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: Opacity(
              opacity: 0.7,
              child: _buildWeatherAnimation(context),
            ),
          ),
        ),
        // Content
        Container(
          padding: CustomSpacer.space20.horizontal,
          child: SafeArea(child: child),
        ),
      ],
    );
  }
}
