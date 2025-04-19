import 'package:flutter/material.dart';

enum WeatherCondition {
  clear,
  cloudy,
  rain,
  thunderstorm,
  snow,
  fog,
  partlyCloudy;

  static WeatherCondition fromString(String condition) {
    final normalizedCondition = condition.toLowerCase();

    if (normalizedCondition.contains('clear') ||
        normalizedCondition.contains('sunny')) {
      return WeatherCondition.clear;
    } else if (normalizedCondition.contains('cloud')) {
      return WeatherCondition.cloudy;
    } else if (normalizedCondition.contains('rain')) {
      return WeatherCondition.rain;
    } else if (normalizedCondition.contains('thunder') ||
        normalizedCondition.contains('storm')) {
      return WeatherCondition.thunderstorm;
    } else if (normalizedCondition.contains('snow')) {
      return WeatherCondition.snow;
    } else if (normalizedCondition.contains('fog') ||
        normalizedCondition.contains('mist')) {
      return WeatherCondition.fog;
    } else {
      return WeatherCondition.partlyCloudy;
    }
  }

  String get animationPath {
    switch (this) {
      case WeatherCondition.clear:
        return 'assets/animations/sunny.json';
      case WeatherCondition.cloudy:
        return 'assets/animations/cloudy.json';
      case WeatherCondition.rain:
        return 'assets/animations/rainy.json';
      case WeatherCondition.thunderstorm:
        return 'assets/animations/thunder.json';
      case WeatherCondition.snow:
        return 'assets/animations/snowy.json';
      case WeatherCondition.fog:
        return 'assets/animations/foggy.json';
      case WeatherCondition.partlyCloudy:
        return 'assets/animations/partly_cloudy.json';
    }
  }

  Color get backgroundColor {
    switch (this) {
      case WeatherCondition.clear:
        return const Color(0xFF87CEEB); // Sky blue
      case WeatherCondition.cloudy:
        return const Color(0xFFB0C4DE); // Light steel blue
      case WeatherCondition.rain:
        return const Color(0xFF4682B4); // Steel blue
      case WeatherCondition.thunderstorm:
        return const Color(0xFF2F4F4F); // Dark slate gray
      case WeatherCondition.snow:
        return const Color(0xFFF0F8FF); // Alice blue
      case WeatherCondition.fog:
        return const Color(0xFFD3D3D3); // Light gray
      case WeatherCondition.partlyCloudy:
        return const Color(0xFFB0C4DE); // Light steel blue
    }
  }
}
