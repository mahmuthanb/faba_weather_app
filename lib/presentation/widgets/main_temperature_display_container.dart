import 'package:cached_network_image/cached_network_image.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:flutter/material.dart';

class MainTemperatureDisplayContainer extends StatelessWidget {
  const MainTemperatureDisplayContainer({super.key, required this.weather});

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final iconUrl = '${getIt<AppConfig>().iconBaseUrl}${weather.icon}@4x.png';
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${weather.temperature.round()}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 96,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          '°c',
          style: TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),

        CachedNetworkImage(
          imageUrl: iconUrl,
          width: 96,
          height: 96,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
