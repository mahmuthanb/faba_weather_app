// Package imports:
import 'package:dio/dio.dart';
import 'package:faba_weather_app/data/models/weather_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  //TODO ADD LANG IDENTIFIER IF HAVE TIME

  @GET("/weather")
  Future<WeatherModel> getCurrentWeather({
    @Query('q') required String cityName,
    @Query('units') String? units,
  });
  @GET("/onecall")
  Future<List<WeatherModel>> getSevenDaysForecast({
    @Query('lat') required String latitude,
    @Query('lon') required String longitude,
    @Query('exclude') String? exclude,
  });
  @GET("/forecast")
  Future<List<WeatherModel>> getThreeHoursForecast({
    @Query('lat') required String latitude,
    @Query('lon') required String longitude,
    @Query('units') String? units,
  });
}
