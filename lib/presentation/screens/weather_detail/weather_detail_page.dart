import 'package:cached_network_image/cached_network_image.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/constants/app_text_styles.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/core/extensions/date_format_extension.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/presentation/widgets/weather_animation_container.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/widgets/base_page.dart';
import 'package:faba_weather_app/presentation/screens/weather_detail/weather_detail_vm.dart';
import 'package:faba_weather_app/presentation/widgets/glassy_container.dart';

class WeatherDetailPage extends BasePage {
  const WeatherDetailPage({super.key, required this.weather});

  final Weather weather;

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState
    extends BasePageState<WeatherDetailPage, WeatherDetailViewModel> {
  @override
  Widget buildBody(BuildContext context, WeatherDetailViewModel viewModel) {
    final iconBase = getIt<AppConfig>().iconBaseUrl;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      widget.weather.timestamp * 1000,
    );

    return WeatherAnimationContainer(
      weatherCondition: widget.weather.weatherCondition,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button and date
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    dateTime.fullDate,
                    style: AppTextStyles.body1.copyWith(
                      color: Colors.white.withAlpha(175),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 24),

              // Main weather info
              GlassyContainer(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Weather icon and temperature
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CachedNetworkImage(
                          imageUrl: '$iconBase/${widget.weather.icon}@4x.png',
                          width: 120,
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '${widget.weather.temperature.round()}°',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 72,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Weather description
                    Text(
                      widget.weather.weatherCondition,
                      style: AppTextStyles.heading2.copyWith(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),

                    // Time
                    Text(
                      dateTime.time12Hour,
                      style: AppTextStyles.body1.copyWith(
                        color: Colors.white.withAlpha(200),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Weather metrics
              GlassyContainer(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Weather details
                    Text(
                      'Weather Details',
                      style: AppTextStyles.heading2.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildWeatherMetric(
                      icon: Icons.thermostat,
                      label: 'Temperature',
                      value: '${widget.weather.temperature.round()}°',
                    ),
                    const Divider(color: Colors.white24),
                    _buildWeatherMetric(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      value: '${widget.weather.humidity}%',
                    ),
                    const Divider(color: Colors.white24),
                    _buildWeatherMetric(
                      icon: Icons.air,
                      label: 'Wind Speed',
                      value: '${widget.weather.windSpeed.round()} km/h',
                    ),
                    const Divider(color: Colors.white24),
                    _buildWeatherMetric(
                      icon: Icons.cloud,
                      label: 'Condition',
                      value: widget.weather.weatherCondition,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherMetric({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(width: 16),
          Text(
            label,
            style: AppTextStyles.body1.copyWith(
              color: Colors.white.withOpacity(0.8),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.body1.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
