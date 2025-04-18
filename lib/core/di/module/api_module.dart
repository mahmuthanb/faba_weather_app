import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/core/network/error_interceptor.dart';
import 'package:faba_weather_app/core/network/logger_interceptor.dart';
import 'package:faba_weather_app/data/services/api_service.dart';

@module
abstract class ApiModule {
  Dio? _injectRetrofitAPI;
  @dev
  @prod
  @test
  @Singleton(order: -96)
  Dio get injectRetrofitAPI {
    if (_injectRetrofitAPI == null) {
      final apiKey = getIt<AppConfig>().apiKey;

      if (apiKey.isEmpty) {
        throw Exception(
          "API_KEY not found. Please run the app with --dart-define=API_KEY=your_api_key",
        );
      }

      Dio dio = Dio(
        BaseOptions(
          baseUrl: getIt<AppConfig>().baseUrl,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "accept": "*/*",
          },
          connectTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
          sendTimeout: const Duration(minutes: 1),
        ),
      );
      dio.options.queryParameters.addAll({'appid': apiKey});
      dio.interceptors.add(ErrorInterceptor());
      if (kDebugMode) {
        dio.interceptors.add(LoggerInterceptor());
      }
      _injectRetrofitAPI = dio;
    }
    return _injectRetrofitAPI!;
  }

  @lazySingleton
  ApiService get apiService => ApiService(injectRetrofitAPI);
}
