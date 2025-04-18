// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  //TODO ADD LANG IDENTIFIER IF HAVE TIME

  @GET("/weather")
  Future<dynamic> getCurrentWeather({
    @Query('q') required String cityName,
    @Query('units') String? units,
  });
  @GET("/onecall")
  Future<dynamic> getSevenDaysForecast({
    @Query('lat') required String latitude,
    @Query('lon') required String longitude,
    @Query('exclude') String? exclude,
  });
}
