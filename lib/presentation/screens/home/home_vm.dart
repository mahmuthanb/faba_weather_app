import 'package:faba_weather_app/data/repositories/weather_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends ChangeNotifier {
  final WeatherRepository _weatherRepository;
  HomeViewModel(this._weatherRepository);
  var weather = "";
  Future<void> getCurrentWeather(String cityName) async {
    final weather = await _weatherRepository.getCurrentWeather(
      cityName: cityName,
      units: "metric",
    );
    this.weather = weather;
    notifyListeners();
  }
}
