import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:faba_weather_app/core/utils/time_utils.dart';
import 'package:faba_weather_app/core/widgets/widgets.dart';
import 'package:faba_weather_app/presentation/widgets/glassy_container.dart';
import 'package:faba_weather_app/presentation/widgets/main_temperature_display_container.dart';
import 'package:faba_weather_app/presentation/widgets/todays_forecasts_carousel.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';
import 'package:faba_weather_app/presentation/widgets/weather_animation_container.dart';
import 'package:faba_weather_app/presentation/widgets/weather_forecast_list.dart';
import 'package:go_router/go_router.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeViewModel> {
  @override
  Widget buildBody(BuildContext context, HomeViewModel viewModel) {
    return WeatherAnimationContainer(
      weatherCondition: viewModel.weather?.weatherCondition ?? 'clear',
      child: Column(
        children: [
          // Header (outside of ScrollView)
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 30),
              const SizedBox(width: 4),
              Text(
                viewModel.weather?.cityAndCountry ?? "Loading",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: viewModel.initializeLocation,
                icon: const Icon(Icons.refresh, color: Colors.white, size: 24),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () => context.push(AppRoutes.settings),
                icon: const Icon(Icons.settings, color: Colors.white, size: 24),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: CustomSpacer.space20.onlyBottom,
              child: Column(
                children: [
                  // Temperature Display
                  if (viewModel.weather != null) ...[
                    MainTemperatureDisplayContainer(
                      weather: viewModel.weather!,
                    ),
                  ],
                  // City Information Card
                  if (viewModel.cityInfo != null) ...[
                    GlassyContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildInfoItem(
                                Icons.people,
                                'Population',
                                '${(viewModel.cityInfo!.population / 1000).toStringAsFixed(1)}K',
                              ),
                              _buildInfoItem(
                                Icons.access_time,
                                'Timezone',
                                'UTC${viewModel.cityInfo!.timezone >= 0 ? '+' : ''}${(viewModel.cityInfo!.timezone / 3600).toStringAsFixed(1)}',
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildInfoItem(
                                Icons.wb_sunny,
                                'Sunrise',
                                TimeUtils.formatTime(
                                  viewModel.cityInfo!.sunrise,
                                ),
                              ),
                              _buildInfoItem(
                                Icons.nights_stay,
                                'Sunset',
                                TimeUtils.formatTime(
                                  viewModel.cityInfo!.sunset,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                  // Today's 3-Hour Forecast
                  if (viewModel.todayForecast != null) ...[
                    TodaysForecastCarousel(forecasts: viewModel.todayForecast!),
                  ],
                  // Five Day Forecast
                  if (viewModel.fiveDayForecast != null) ...[
                    WeatherForecastList(forecasts: viewModel.fiveDayForecast!),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String label, String value) {
    return SizedBox(
      width: 100,
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(color: Colors.white.withAlpha(175), fontSize: 12),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
