import 'package:faba_weather_app/data/services/storage_service.dart';

extension TemperatureExtension on double {
  /// Returns the temperature unit symbol (°C or °F)
  String get temperatureUnitSymbol {
    final unit = StorageService.getTemperatureUnit();
    return unit == 'imperial' ? '°F' : '°C';
  }
}
