import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:faba_weather_app/domain/entities/weather.dart';

part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@Freezed(toJson: true, fromJson: true)
class WeatherModel extends Weather with _$WeatherModel {
  const factory WeatherModel({
    required double temperature,
    required String description,
    required String icon,
    required int humidity,
    required double windSpeed,
    required String cityName,
    required double latitude,
    required double longitude,
    required double feelsLike,
    required int pressure,
    required int visibility,
    required int windDeg,
    required String country,
    required int sunrise,
    required int sunset,
  }) = _WeatherModel;

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temperature: (json['main']['temp'] as num).toDouble(),
      description: json['weather'][0]['description'] as String,
      icon: json['weather'][0]['icon'] as String,
      humidity: json['main']['humidity'] as int,
      windSpeed: (json['wind']['speed'] as num).toDouble(),
      cityName: json['name'] as String,
      latitude: (json['coord']['lat'] as num).toDouble(),
      longitude: (json['coord']['lon'] as num).toDouble(),
      feelsLike: (json['main']['feels_like'] as num).toDouble(),
      pressure: json['main']['pressure'] as int,
      visibility: json['visibility'] as int,
      windDeg: json['wind']['deg'] as int,
      country: json['sys']['country'] as String,
      sunrise: json['sys']['sunrise'] as int,
      sunset: json['sys']['sunset'] as int,
    );
  }
}
