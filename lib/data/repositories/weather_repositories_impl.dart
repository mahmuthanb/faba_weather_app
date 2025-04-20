import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/domain/repositories/weather_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:faba_weather_app/data/services/api_service.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';

@Injectable(as: WeatherRepository)
@prod
@dev
@Singleton(order: -98)
class WeatherRepositoryImpl extends WeatherRepository {
  final ApiService _apiService;
  WeatherRepositoryImpl(this._apiService);

  @override
  Future<Weather> getCurrentWeather({
    required String cityName,
    required String units,
  }) async {
    return await _apiService.getCurrentWeather(
      cityName: cityName,
      units: units,
    );
  }

  @override
  Future<Weather> getCurrentWeatherByLocation({
    required String latitude,
    required String longitude,
    required String units,
  }) async {
    return await _apiService.getCurrentWeatherByLocation(
      latitude: latitude,
      longitude: longitude,
      units: units,
    );
  }

  @override
  Future<List<Weather>> getSevenDaysWeather({
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

  @override
  Future<ForecastResponseModel> getThreeHoursWeather({
    required String latitude,
    required String longitude,
    required String units,
  }) async {
    return await _apiService.getThreeHoursForecast(
      latitude: latitude,
      longitude: longitude,
      units: units,
    );
  }
}
