import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:faba_weather_app/data/services/api_service.dart';

@Injectable(as: WeatherRepository)
@prod
@dev
@test
@Singleton(order: -98)
class WeatherRepositoryImpl extends WeatherRepository {
  final ApiService _apiService;
  WeatherRepositoryImpl(this._apiService);

  @override
  Future<Weather> getCurrentWeather({
    required String cityName,
    required String units,
  }) async {
    final response = await _apiService.getCurrentWeather(
      cityName: cityName,
      units: units,
    );
    return Weather(
      temperature: response.temperature,
      description: response.description,
      icon: response.icon,
      humidity: response.humidity,
      windSpeed: response.windSpeed,
      cityName: response.cityName,
    );
  }

  @override
  Future<List<Weather>> getSevenDaysWeather({
    required String latitude,
    required String longitude,
    required String exclude,
  }) async {
    final response = await _apiService.getSevenDaysForecast(
      latitude: latitude,
      longitude: longitude,
      exclude: exclude,
    );
    return response
        .map(
          (model) => Weather(
            temperature: model.temperature,
            description: model.description,
            icon: model.icon,
            humidity: model.humidity,
            windSpeed: model.windSpeed,
            cityName: model.cityName,
          ),
        )
        .toList();
  }
}
