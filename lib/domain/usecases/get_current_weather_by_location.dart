import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentWeatherByLocationUseCase {
  final WeatherRepository _weatherRepository;

  GetCurrentWeatherByLocationUseCase(this._weatherRepository);

  Future<Weather> call({
    required String latitude,
    required String longitude,
    required String units,
  }) async {
    return await _weatherRepository.getCurrentWeatherByLocation(
      latitude: latitude,
      longitude: longitude,
      units: units,
    );
  }
}
