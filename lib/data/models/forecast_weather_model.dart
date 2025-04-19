import 'package:json_annotation/json_annotation.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';

part 'forecast_weather_model.g.dart';

@JsonSerializable()
class ForecastWeatherModel extends Weather {
  final String dtTxt;
  final double feelsLike;
  final int pressure;
  final int visibility;
  final int windDeg;
  final double latitude;
  final double longitude;

  ForecastWeatherModel({
    required super.temperature,
    required super.description,
    required super.icon,
    required super.humidity,
    required super.windSpeed,
    required super.weatherCondition,
    required super.timestamp,
    required this.dtTxt,
    required this.feelsLike,
    required this.pressure,
    required this.visibility,
    required this.windDeg,
    required this.latitude,
    required this.longitude,
  });

  factory ForecastWeatherModel.fromJson(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>? ?? {};
    final weather =
        ((json['weather'] as List?)?.firstOrNull as Map<String, dynamic>?) ??
        {};
    final wind = json['wind'] as Map<String, dynamic>? ?? {};

    return ForecastWeatherModel(
      temperature: (main['temp'] as num?)?.toDouble() ?? 0.0,
      description: weather['description'] as String? ?? '',
      icon: weather['icon'] as String? ?? '',
      humidity: main['humidity'] as int? ?? 0,
      windSpeed: (wind['speed'] as num?)?.toDouble() ?? 0.0,
      weatherCondition: weather['main'] as String? ?? '',
      timestamp: json['dt'] as int? ?? 0,
      dtTxt: json['dt_txt'] as String? ?? '',
      feelsLike: (main['feels_like'] as num?)?.toDouble() ?? 0.0,
      pressure: main['pressure'] as int? ?? 0,
      visibility: json['visibility'] as int? ?? 0,
      windDeg: wind['deg'] as int? ?? 0,
      latitude: json['coord']?['lat'] as double? ?? 0.0,
      longitude: json['coord']?['lon'] as double? ?? 0.0,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$ForecastWeatherModelToJson(this);
}
