import 'package:faba_weather_app/data/models/current_weather_model.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';
import 'package:faba_weather_app/data/models/forecast_weather_model.dart';

class MockCurrentWeatherModel extends CurrentWeatherModel {
  MockCurrentWeatherModel({
    super.temperature = 20.0,
    super.description = 'Clear sky',
    super.icon = '01d',
    super.humidity = 65,
    super.windSpeed = 5.0,
    super.weatherCondition = 'Clear',
    super.timestamp = 1234567890,
    super.city = 'Test City',
    super.country = 'Test Country',
    super.feelsLike = 22.0,
    super.pressure = 1013,
    super.visibility = 10000,
    super.windDeg = 180,
    super.sunrise = 1234567890,
    super.sunset = 1234567890,
    super.latitude = 37.7749,
    super.longitude = -122.4194,
  });
}

class MockForecastWeatherModel extends ForecastWeatherModel {
  MockForecastWeatherModel({
    super.temperature = 20.0,
    super.description = 'Clear sky',
    super.icon = '01d',
    super.humidity = 65,
    super.windSpeed = 5.0,
    super.weatherCondition = 'Clear',
    super.timestamp = 1234567890,
    super.dtTxt = '2024-03-20 12:00:00',
    super.feelsLike = 22.0,
    super.pressure = 1013,
    super.visibility = 10000,
    super.windDeg = 180,
    super.latitude = 37.7749,
    super.longitude = -122.4194,
  });
}

class MockForecastResponseModel extends ForecastResponseModel {
  MockForecastResponseModel({List<ForecastWeatherModel>? list, CityInfo? city})
    : super(
        list: list ?? List.generate(5, (index) => MockForecastWeatherModel()),
        city: city ?? MockCityInfo(),
      );
}

class MockCityInfo extends CityInfo {
  MockCityInfo({
    super.name = 'Test City',
    super.country = 'Test Country',
    super.lat = 37.7749,
    super.lon = -122.4194,
    super.population = 1000000,
    super.timezone = 3600,
    super.sunrise = 1234567890,
    super.sunset = 1234567890,
  });
}
