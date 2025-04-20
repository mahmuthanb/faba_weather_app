import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/presentation/widgets/glassy_container.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:go_router/go_router.dart';
import 'package:faba_weather_app/core/extensions/date_format_extension.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';

class WeatherForecastList extends StatelessWidget {
  final List<Weather> forecasts;

  const WeatherForecastList({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return GlassyContainer(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              l10n.fiveDayForecast,
              style: const TextStyle(
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
            final iconUrl =
                '${getIt<AppConfig>().iconBaseUrl}${weather.icon}@4x.png';

            return InkWell(
              onTap:
                  () => context.push(AppRoutes.weatherDetail, extra: weather),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: iconUrl,
                      width: 50,
                      height: 50,
                      placeholder:
                          (context, url) => const CircularProgressIndicator(),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            time.shortDayOfWeek,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            weather.description,
                            style: TextStyle(
                              color: Colors.white.withAlpha(175),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '${weather.temperature.round()}°',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
