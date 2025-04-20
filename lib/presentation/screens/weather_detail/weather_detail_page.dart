import 'package:cached_network_image/cached_network_image.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/data/services/api_service.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/widgets/base_page.dart';
import 'package:faba_weather_app/presentation/screens/weather_detail/weather_detail_vm.dart';

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
    return Container();
  }
}
