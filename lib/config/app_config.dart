// Package imports:
import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
  String get iconBaseUrl;
  String get apiKey;
}

@prod
@Singleton(as: AppConfig)
@Order(-97)
class AppConfigProdImpl implements AppConfig {
  @override
  String get baseUrl => "https://api.openweathermap.org/data/2.5";

  @override
  String get iconBaseUrl => "https://openweathermap.org/img/wn/";

  @override
  String get apiKey =>
      const String.fromEnvironment("API_KEY", defaultValue: "");
}

@dev
@test
@Singleton(as: AppConfig)
@Order(-97)
class AppConfigDevImpl implements AppConfig {
  @override
  String get baseUrl => "https://api.openweathermap.org/data/2.5";

  @override
  String get iconBaseUrl => "https://openweathermap.org/img/wn/";

  @override
  String get apiKey =>
      const String.fromEnvironment("API_KEY", defaultValue: "");
}
