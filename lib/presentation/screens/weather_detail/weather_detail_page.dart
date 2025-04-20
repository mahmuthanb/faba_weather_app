import 'package:flutter/material.dart';
import 'package:faba_weather_app/core/widgets/base_page.dart';
import 'package:faba_weather_app/presentation/screens/weather_detail/weather_detail_vm.dart';

class WeatherDetailPage extends BasePage {
  const WeatherDetailPage({super.key});

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
