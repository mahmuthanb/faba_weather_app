import 'package:injectable/injectable.dart';
import 'package:faba_weather_app/core/services/location_service.dart';
import 'package:faba_weather_app/data/services/api_service.dart';
import 'package:faba_weather_app/domain/repositories/weather_repository.dart';
import 'package:faba_weather_app/data/models/current_weather_model.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:geolocator/geolocator.dart';
import '../mocks/mock_models.dart';

@module
abstract class TestModule {
  @test
  @LazySingleton(as: ApiService)
  ApiService get testApiService => TestApiService();

  @test
  @LazySingleton(as: WeatherRepository)
  WeatherRepository get testWeatherRepository =>
      TestWeatherRepository(apiService: TestApiService());

  @test
  @LazySingleton(as: LocationService)
  LocationService get testLocationService => TestLocationService();
}

@test
class TestApiService implements ApiService {
  bool throwError = false;
  final _mockCurrentWeather = MockCurrentWeatherModel();
  final _mockForecastWeather = MockForecastWeatherModel();

  @override
  Future<CurrentWeatherModel> getCurrentWeather({
    required String cityName,
    String? units,
  }) async {
    if (throwError) {
      throw Exception('Test error');
    }
    return _mockCurrentWeather;
  }

  @override
  Future<CurrentWeatherModel> getCurrentWeatherByLocation({
    required String latitude,
    required String longitude,
    String? units,
  }) async {
    if (throwError) {
      throw Exception('Test error');
    }
    return _mockCurrentWeather;
  }

  @override
  Future<List<Weather>> getSevenDaysForecast({
    required String latitude,
    required String longitude,
    String? exclude,
  }) async {
    if (throwError) {
      throw Exception('Test error');
    }
    return List.generate(7, (index) => _mockCurrentWeather);
  }

  @override
  Future<ForecastResponseModel> getThreeHoursForecast({
    required String latitude,
    required String longitude,
    String? units,
  }) async {
    if (throwError) {
      throw Exception('Test error');
    }
    return MockForecastResponseModel(
      list: List.generate(5, (index) => _mockForecastWeather),
    );
  }
}

@test
class TestWeatherRepository implements WeatherRepository {
  final ApiService apiService;
  bool throwError = false;

  TestWeatherRepository({required this.apiService});

  @override
  Future<Weather> getCurrentWeather({
    required String cityName,
    required String units,
  }) {
    if (throwError) {
      throw Exception('Test error');
    }
    return apiService.getCurrentWeather(cityName: cityName, units: units);
  }

  @override
  Future<Weather> getCurrentWeatherByLocation({
    required String latitude,
    required String longitude,
    required String units,
  }) {
    if (throwError) {
      throw Exception('Test error');
    }
    return apiService.getCurrentWeatherByLocation(
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
  }) {
    if (throwError) {
      throw Exception('Test error');
    }
    return apiService.getSevenDaysForecast(
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
  }) {
    if (throwError) {
      throw Exception('Test error');
    }
    return apiService.getThreeHoursForecast(
      latitude: latitude,
      longitude: longitude,
      units: units,
    );
  }
}

@test
class TestLocationService implements LocationService {
  bool throwError = false;

  @override
  Future<Position?> getCurrentLocation() async {
    if (throwError) {
      throw Exception('Test error');
    }
    return Position(
      latitude: 37.7749,
      longitude: -122.4194,
      timestamp: DateTime.now(),
      accuracy: 0,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0,
      altitudeAccuracy: 0,
      headingAccuracy: 0,
    );
  }
}
