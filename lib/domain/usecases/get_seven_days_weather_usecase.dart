import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSevenDaysWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetSevenDaysWeatherUseCase(this._weatherRepository);

  Future<List<Weather>> call({
    required String latitude,
    required String longitude,
    required String exclude,
  }) async {
    return await _weatherRepository.getSevenDaysWeather(
      latitude: latitude,
      longitude: longitude,
      exclude: exclude,
    );
  }
}
