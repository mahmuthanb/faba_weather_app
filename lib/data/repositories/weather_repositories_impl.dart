import 'package:injectable/injectable.dart';
import 'package:faba_weather_app/data/repositories/weather_repository.dart';
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
  Future<dynamic> getCurrentWeather({
    required String cityName,
    required String units,
  }) async {
    return await _apiService.getCurrentWeather(
      cityName: cityName,
      units: units,
    );
  }

  @override
  Future<dynamic> getSevenDaysWeather({
    required String latitude,
    required String longitude,
    required String exclude,
  }) async {
    return await _apiService.getSevenDaysForecast(
      latitude: latitude,
      longitude: longitude,
      exclude: exclude,
    );
  }
}
