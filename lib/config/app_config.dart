// Package imports:
import 'package:injectable/injectable.dart';

abstract class AppConfig {
  String get baseUrl;
}

@prod
@Singleton(as: AppConfig)
@Order(-97)
class AppConfigProdImpl implements AppConfig {
  @override
  String get baseUrl => "https://api.openweathermap.org/data/2.5";
}

@dev
@test
@Singleton(as: AppConfig)
@Order(-97)
class AppConfigDevImpl implements AppConfig {
  @override
  String get baseUrl => "https://api.openweathermap.org/data/2.5";
}
