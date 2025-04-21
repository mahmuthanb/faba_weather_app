import 'package:faba_weather_app/config/router/routes.dart';
import 'package:faba_weather_app/core/constants/app_dimensions.dart';
import 'package:faba_weather_app/core/widgets/widgets.dart';
import 'package:faba_weather_app/presentation/widgets/city_info_card.dart';
import 'package:faba_weather_app/presentation/widgets/location_search_bottom_sheet.dart';
import 'package:faba_weather_app/presentation/widgets/main_temperature_display_container.dart';
import 'package:faba_weather_app/presentation/widgets/todays_forecasts_carousel.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/presentation/screens/home/home_vm.dart';
import 'package:faba_weather_app/presentation/widgets/weather_animation_container.dart';
import 'package:faba_weather_app/presentation/widgets/weather_forecast_list.dart';
import 'package:go_router/go_router.dart';
import 'package:faba_weather_app/core/l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:faba_weather_app/presentation/providers/temperature_provider.dart';

class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage, HomeViewModel> {
  @override
  Widget buildBody(BuildContext context, HomeViewModel viewModel) {
    final l10n = AppLocalizations.of(context);
    final temperatureProvider = context.watch<TemperatureProvider>();

    if (temperatureProvider.hasChanged) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        viewModel.refreshWeatherData();
        temperatureProvider.clearChange();
      });
    }

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
                viewModel.weather?.cityAndCountry ?? l10n.loading,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed:
                    () => LocationSearchBottomSheet.show(context, viewModel),
                icon: const Icon(Icons.search, color: Colors.white, size: 24),
              ),
              IconButton(
                onPressed: () => context.push(AppRoutes.settings),
                icon: const Icon(Icons.settings, color: Colors.white, size: 24),
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
                  MainTemperatureDisplayContainer(weather: viewModel.weather),
                  // City Information Card
                  CityInfoCard(cityInfo: viewModel.cityInfo),
                  // Today's 3-Hour Forecast
                  TodaysForecastCarousel(forecasts: viewModel.todayForecast),
                  // Five Day Forecast
                  WeatherForecastList(forecasts: viewModel.fiveDayForecast),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
