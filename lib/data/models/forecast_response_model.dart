import 'package:json_annotation/json_annotation.dart';
import 'package:faba_weather_app/data/models/forecast_weather_model.dart';

part 'forecast_response_model.g.dart';

@JsonSerializable()
class ForecastResponseModel {
  final List<ForecastWeatherModel> list;
  final CityInfo city;

  ForecastResponseModel({required this.list, required this.city});

  factory ForecastResponseModel.fromJson(Map<String, dynamic> json) {
    final list =
        (json['list'] as List?)
            ?.map(
              (e) => ForecastWeatherModel.fromJson(e as Map<String, dynamic>),
            )
            .toList() ??
        [];

    final cityJson = json['city'] as Map<String, dynamic>? ?? {};
    final city = CityInfo.fromJson(cityJson);

    return ForecastResponseModel(list: list, city: city);
  }

  Map<String, dynamic> toJson() => _$ForecastResponseModelToJson(this);
}

@JsonSerializable()
class CityInfo {
  final String name;
  final String country;
  final double lat;
  final double lon;
  final int population;
  final int timezone;
  final int sunrise;
  final int sunset;

  CityInfo({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });

  factory CityInfo.fromJson(Map<String, dynamic> json) {
    final coord = json['coord'] as Map<String, dynamic>? ?? {};

    return CityInfo(
      name: json['name'] as String? ?? '',
      country: json['country'] as String? ?? '',
      lat: (coord['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (coord['lon'] as num?)?.toDouble() ?? 0.0,
      population: json['population'] as int? ?? 0,
      timezone: json['timezone'] as int? ?? 0,
      sunrise: json['sunrise'] as int? ?? 0,
      sunset: json['sunset'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => _$CityInfoToJson(this);
}
