import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeather({
    required String cityName,
    required String units,
  });

  Future<Weather> getCurrentWeatherByLocation({
    required String latitude,
    required String longitude,
    required String units,
  });

  Future<List<Weather>> getSevenDaysWeather({
    required String latitude,
    required String longitude,
    required String exclude,
  });

  Future<ForecastResponseModel> getThreeHoursWeather({
    required String latitude,
    required String longitude,
    required String units,
  });
}
