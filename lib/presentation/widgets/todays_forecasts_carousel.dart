import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/presentation/widgets/glassy_container.dart';
import 'package:faba_weather_app/presentation/widgets/shimmer_placeholder.dart';
import 'package:faba_weather_app/presentation/widgets/weather_forecast_card.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';

class TodaysForecastCarousel extends StatelessWidget {
  const TodaysForecastCarousel({super.key, required this.forecasts});

  final List<Weather>? forecasts;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.26,
      child:
          forecasts == null
              ? const ShimmerPlaceholder(isGlassy: true)
              : GlassyContainer(
                padding: CustomSpacer.space16.vertical,
                child: Column(
                  children: [
                    Text(
                      l10n.todaysForecast,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.17,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemCount: forecasts!.length,
                        itemBuilder: (context, index) {
                          return WeatherForecastCard(
                            weather: forecasts![index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}
