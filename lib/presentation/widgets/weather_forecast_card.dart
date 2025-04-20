import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/core/extensions/date_format_extension.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WeatherForecastCard extends StatelessWidget {
  final Weather weather;
  final CityInfo? cityInfo;

  const WeatherForecastCard({super.key, required this.weather, this.cityInfo});

  @override
  Widget build(BuildContext context) {
    final time = DateTime.fromMillisecondsSinceEpoch(weather.timestamp * 1000);
    final iconUrl = '${getIt<AppConfig>().iconBaseUrl}${weather.icon}@4x.png';

    return Padding(
      padding: CustomSpacer.space8.all,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            time.time24Hour,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          CachedNetworkImage(
            imageUrl: iconUrl,
            width: 40,
            height: 40,
            fit: BoxFit.contain,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          const SizedBox(height: 8),
          Text(
            '${weather.temperature.round()}°',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.air, color: Colors.white, size: 16),
              const SizedBox(width: 4),
              Text(
                '${weather.windSpeed.round()} km/h',
                style: TextStyle(
                  color: Colors.white.withAlpha(175),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
