import 'package:cached_network_image/cached_network_image.dart';
import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:faba_weather_app/core/utils/time_utils.dart';
import 'package:faba_weather_app/core/widgets/widgets.dart';
import 'package:faba_weather_app/presentation/widgets/glassy_container.dart';
import 'package:faba_weather_app/presentation/widgets/todays_forecasts_list.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';
import 'package:faba_weather_app/presentation/widgets/weather_animation_container.dart';
import 'package:faba_weather_app/presentation/widgets/weather_forecast_card.dart';
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
      temperature: viewModel.weather?.temperature ?? 20.0,
      child: SingleChildScrollView(
        padding: CustomSpacer.space20.onlyBottom,
        child: Column(
          children: [
            // Header
            Row(
              children: [
                if (viewModel.location != null) ...[
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 30,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        viewModel.weather?.cityAndCountry ?? "",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
                const Spacer(),
                IconButton(
                  onPressed: () => context.push(AppRoutes.settings),
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                    size: 20,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                const SizedBox(width: 16),
                IconButton(
                  onPressed: viewModel.initializeLocation,
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 20,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Temperature Display
            if (viewModel.weather != null) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${viewModel.weather!.temperature.round()}',
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

                  if (viewModel.iconUrl != null)
                    CachedNetworkImage(
                      imageUrl: viewModel.iconUrl!,
                      width: 96,
                      height: 96,
                      fit: BoxFit.cover,
                    ),
                ],
              ),
            ],
            // const SizedBox(height: 32),
            // City Information Card
            if (viewModel.cityInfo != null) ...[
              GlassyContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_city,
                          color: Colors.white,
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${viewModel.cityInfo!.name}, ${viewModel.cityInfo!.country}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
                          TimeUtils.formatTime(viewModel.cityInfo!.sunrise),
                        ),
                        _buildInfoItem(
                          Icons.nights_stay,
                          'Sunset',
                          TimeUtils.formatTime(viewModel.cityInfo!.sunset),
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
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
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
