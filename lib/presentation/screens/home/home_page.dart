import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/core/constants/app_colors.dart';
import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:faba_weather_app/core/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';
import 'package:faba_weather_app/presentation/widgets/weather_animation_container.dart';
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
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      viewModel.weather?.cityName ?? "",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
              const Spacer(),
              IconButton(
                onPressed: () => context.push(AppRoutes.settings),
                icon: const Icon(Icons.settings, color: Colors.white, size: 20),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: viewModel.initializeLocation,
                icon: const Icon(Icons.refresh, color: Colors.white, size: 20),
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
              children: [
                Text(
                  '${viewModel.weather!.temperature.round()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '°C',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Text(
              viewModel.weather!.weatherCondition,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
