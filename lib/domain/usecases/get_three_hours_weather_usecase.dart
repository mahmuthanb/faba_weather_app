import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetThreeHoursWeatherUseCase {
  final WeatherRepository _weatherRepository;

  GetThreeHoursWeatherUseCase(this._weatherRepository);

  Future<List<Weather>> call({
    required String latitude,
    required String longitude,
    required String units,
  }) async {
    return await _weatherRepository.getThreeHoursWeather(
      latitude: latitude,
      longitude: longitude,
      units: units,
    );
  }
}
