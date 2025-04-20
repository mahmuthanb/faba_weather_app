import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/presentation/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class WeatherDetailViewModel extends BaseViewModel {
  WeatherDetailViewModel();

  Weather? _weather;
  Weather? get weather => _weather;

  void setWeather(Weather weather) {
    _weather = weather;
    notifyListeners();
  }
}
