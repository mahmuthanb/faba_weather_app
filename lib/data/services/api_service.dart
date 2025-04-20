// Package imports:
import 'package:dio/dio.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';
import 'package:retrofit/retrofit.dart';
import 'package:faba_weather_app/data/models/current_weather_model.dart';
import 'package:faba_weather_app/data/models/forecast_response_model.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/weather")
  Future<CurrentWeatherModel> getCurrentWeather({
    @Query('q') required String cityName,
    @Query('units') String? units,
  });

  @GET("/weather")
  Future<CurrentWeatherModel> getCurrentWeatherByLocation({
    @Query('lat') required String latitude,
    @Query('lon') required String longitude,
    @Query('units') String? units,
  });

  /// CAN NOT BE USED BECAUSE OF API IS NO LONGER FREE
  @GET("/onecall")
  Future<List<Weather>> getSevenDaysForecast({
    @Query('lat') required String latitude,
    @Query('lon') required String longitude,
    @Query('exclude') String? exclude,
  });

  @GET("/forecast")
  Future<ForecastResponseModel> getThreeHoursForecast({
    @Query('lat') required String latitude,
    @Query('lon') required String longitude,
    @Query('units') String? units,
  });
}
