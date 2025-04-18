import 'package:faba_weather_app/domain/usecases/get_current_weather_usecase.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  HomeViewModel(this._getCurrentWeatherUseCase);

  var weather = "";

  Future<void> getCurrentWeather(String cityName) async {
    final weather = await _getCurrentWeatherUseCase(
      cityName: cityName,
      units: "metric",
    );
    this.weather = weather.toString();
    notifyListeners();
  }
}
