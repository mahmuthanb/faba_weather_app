import 'package:flutter/material.dart';
import 'package:faba_weather_app/data/services/storage_service.dart';

enum UnitType { metric, imperial }

class TemperatureProvider with ChangeNotifier {
  late UnitType _temperatureUnit;

  TemperatureProvider() {
    _temperatureUnit = UnitType.values.byName(
      StorageService.getTemperatureUnit(),
    );
  }

  UnitType get temperatureUnit => _temperatureUnit;

  void setTemperatureUnit(UnitType unit) {
    _temperatureUnit = unit;
    StorageService.setTemperatureUnit(unit.name);
    notifyListeners();
  }
}
