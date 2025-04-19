import 'package:json_annotation/json_annotation.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';

part 'current_weather_model.g.dart';

@JsonSerializable()
class CurrentWeatherModel extends Weather {
  final String city;
  final String country;
  final double feelsLike;
  final int pressure;
  final int visibility;
  final int windDeg;
  final int sunrise;
  final int sunset;
  final double latitude;
  final double longitude;

  CurrentWeatherModel({
    required super.temperature,
    required super.description,
    required super.icon,
    required super.humidity,
    required super.windSpeed,
    required super.weatherCondition,
    required super.timestamp,
    required this.city,
    required this.country,
    required this.feelsLike,
    required this.pressure,
    required this.visibility,
    required this.windDeg,
    required this.sunrise,
    required this.sunset,
    required this.latitude,
    required this.longitude,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>? ?? {};
    final weather =
        ((json['weather'] as List?)?.firstOrNull as Map<String, dynamic>?) ??
        {};
    final wind = json['wind'] as Map<String, dynamic>? ?? {};
    final sys = json['sys'] as Map<String, dynamic>? ?? {};
    final coord = json['coord'] as Map<String, dynamic>? ?? {};

    return CurrentWeatherModel(
      temperature: (main['temp'] as num?)?.toDouble() ?? 0.0,
      description: weather['description'] as String? ?? '',
      icon: weather['icon'] as String? ?? '',
      humidity: main['humidity'] as int? ?? 0,
      windSpeed: (wind['speed'] as num?)?.toDouble() ?? 0.0,
      weatherCondition: weather['main'] as String? ?? '',
      timestamp: json['dt'] as int? ?? 0,
      city: json['name'] as String? ?? '',
      country: sys['country'] as String? ?? '',
      feelsLike: (main['feels_like'] as num?)?.toDouble() ?? 0.0,
      pressure: main['pressure'] as int? ?? 0,
      visibility: json['visibility'] as int? ?? 0,
      windDeg: wind['deg'] as int? ?? 0,
      sunrise: sys['sunrise'] as int? ?? 0,
      sunset: sys['sunset'] as int? ?? 0,
      latitude: (coord['lat'] as num?)?.toDouble() ?? 0.0,
      longitude: (coord['lon'] as num?)?.toDouble() ?? 0.0,
    );
  }

  @override
  Map<String, dynamic> toJson() => _$CurrentWeatherModelToJson(this);
}
