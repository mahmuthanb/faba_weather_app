import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final double temperature;
  final String description;
  final String? city;
  final String? country;
  final String icon;
  final int humidity;
  final double windSpeed;
  final String weatherCondition;
  final int timestamp;

  Weather({
    required this.temperature,
    required this.description,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.weatherCondition,
    required this.timestamp,
    this.city,
    this.country,
  });

  String get cityAndCountry {
    if (city != null && country != null) {
      return '$city, $country';
    } else if (city != null) {
      return city!;
    } else if (country != null) {
      return country!;
    }
    return '';
  }

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
