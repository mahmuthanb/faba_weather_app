import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:faba_weather_app/config/app_config.dart';
import 'package:faba_weather_app/core/di/locator.dart';
import 'package:faba_weather_app/core/network/error_interceptor.dart';
import 'package:faba_weather_app/core/network/logger_interceptor.dart';

@module
abstract class ApiModule {
  Dio? _injectRetrofitAPI;
  @dev
  @prod
  @test
  @Singleton(order: -96)
  Dio get injectRetrofitAPI {
    if (_injectRetrofitAPI == null) {
      Dio dio = Dio(
        BaseOptions(
          baseUrl: getIt<AppConfig>().baseUrl,
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
            "accept": "*/*",
          },
          // User Dart Define method to put your API_KEY into env
          queryParameters: {
            'appid': String.fromEnvironment(
              "API_KEY",
              defaultValue: "YOUR_API_KEY",
            ),
          },
          connectTimeout: const Duration(minutes: 1),
          receiveTimeout: const Duration(minutes: 1),
          sendTimeout: const Duration(minutes: 1),
        ),
      );
      dio.interceptors.add(ErrorInterceptor());
      if (kDebugMode) {
        dio.interceptors.add(LoggerInterceptor());
      }
      _injectRetrofitAPI = dio;
    }
    return _injectRetrofitAPI!;
  }
}
