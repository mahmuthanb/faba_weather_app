import 'package:flutter/material.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:intl/intl.dart';
import 'package:faba_weather_app/core/enums/weather_condition.dart';

class WeatherForecastList extends StatelessWidget {
  final List<Weather> forecasts;

  const WeatherForecastList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              '5-Day Forecast',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ...forecasts.map((weather) {
            final time = DateTime.fromMillisecondsSinceEpoch(
              weather.timestamp * 1000,
            );
            final dayOfWeek = DateFormat('EEE').format(time);
            final date = DateFormat('d MMM').format(time);
            final condition = WeatherCondition.fromString(
              weather.weatherCondition,
            );

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  // Day and Date
                  SizedBox(
                    width: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dayOfWeek,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Weather Condition
                  Expanded(
                    child: Text(
                      weather.description,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Day Weather Icon
                  Icon(
                    _getWeatherIcon(condition, isDay: true),
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  // Night Weather Icon
                  Icon(
                    _getWeatherIcon(condition, isDay: false),
                    color: Colors.white.withOpacity(0.7),
                    size: 24,
                  ),
                  const SizedBox(width: 16),
                  // Temperature Range
                  Text(
                    '${weather.temperature.round()}°',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  IconData _getWeatherIcon(WeatherCondition condition, {required bool isDay}) {
    switch (condition) {
      case WeatherCondition.clear:
        return isDay ? Icons.wb_sunny : Icons.nightlight_round;
      case WeatherCondition.cloudy:
        return isDay ? Icons.cloud : Icons.cloud_queue;
      case WeatherCondition.rain:
        return isDay ? Icons.water_drop : Icons.water_drop_outlined;
      case WeatherCondition.thunderstorm:
        return isDay ? Icons.thunderstorm : Icons.thunderstorm_outlined;
      case WeatherCondition.snow:
        return isDay ? Icons.ac_unit : Icons.ac_unit_outlined;
      case WeatherCondition.fog:
        return isDay ? Icons.cloud : Icons.cloud_queue;
      case WeatherCondition.partlyCloudy:
        return isDay ? Icons.cloud : Icons.cloud_queue;
    }
  }
}
