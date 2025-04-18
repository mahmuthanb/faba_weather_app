import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherUseCase(this._weatherRepository);

  Future<Weather> call({
    required String cityName,
    required String units,
  }) async {
    return await _weatherRepository.getCurrentWeather(
      cityName: cityName,
      units: units,
    );
  }
}
