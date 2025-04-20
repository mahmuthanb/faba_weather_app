import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/presentation/widgets/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WeatherForecastList extends StatelessWidget {
  final List<Weather> forecasts;

  const WeatherForecastList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return GlassyContainer(
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
            final iconUrl =
                '${getIt<AppConfig>().iconBaseUrl}${weather.icon}@4x.png';

            return InkWell(
              onTap: () => context.push(AppRoutes.weatherDetail),
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
                            color: Colors.white.withAlpha(175),
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
                      weather.weatherCondition,
                      style: TextStyle(
                        color: Colors.white.withAlpha(225),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Weather Icon
                  CachedNetworkImage(
                    imageUrl: iconUrl,
                    width: 40,
                    height: 40,
                    fit: BoxFit.contain,
                    placeholder:
                        (context, url) => const CircularProgressIndicator(),
                    errorWidget:
                        (context, url, error) => const Icon(Icons.error),
                  ),
                  const SizedBox(width: 16),
                  // Temperature
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
}
