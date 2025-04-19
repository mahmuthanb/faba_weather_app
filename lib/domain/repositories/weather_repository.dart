import 'package:faba_weather_app/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getCurrentWeather({
    required String cityName,
    required String units,
  });

  Future<List<Weather>> getSevenDaysWeather({
    required String latitude,
    required String longitude,
    required String exclude,
  });

  Future<List<Weather>> getThreeHoursWeather({
    required String latitude,
    required String longitude,
    required String units,
  });
}
