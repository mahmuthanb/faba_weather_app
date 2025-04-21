import 'package:flutter/material.dart';
import 'package:faba_weather_app/data/services/storage_service.dart';

class TemperatureProvider extends ChangeNotifier {
  String _unit = StorageService.getTemperatureUnit();
  String get unit => _unit;
  bool _hasChanged = false;
  bool get hasChanged => _hasChanged;

  void setUnit(String unit) {
    if (_unit != unit) {
      _unit = unit;
      _hasChanged = true;
      StorageService.setTemperatureUnit(unit);
      notifyListeners();
    }
  }

  void clearChange() {
    _hasChanged = false;
  }
}
