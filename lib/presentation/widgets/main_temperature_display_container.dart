import 'package:cached_network_image/cached_network_image.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/presentation/widgets/shimmer_placeholder.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/extensions/temperature_extension.dart';

class MainTemperatureDisplayContainer extends StatelessWidget {
  const MainTemperatureDisplayContainer({super.key, required this.weather});

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final iconUrl =
        weather == null
            ? null
            : '${getIt<AppConfig>().iconBaseUrl}${weather!.icon}@4x.png';
    return SizedBox(
      height: size.height * 0.125,
      width: size.width,
      child:
          weather == null
              ? const ShimmerPlaceholder(isGlassy: true)
              : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${weather!.temperature.round()}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 96,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weather!.temperature.temperatureUnitSymbol,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),

                  CachedNetworkImage(
                    imageUrl: iconUrl!,
                    width: 96,
                    height: 96,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
    );
  }
}
