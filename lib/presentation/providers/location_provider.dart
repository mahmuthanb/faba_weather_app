import 'package:faba_weather_app/core/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocationProvider extends ChangeNotifier {
  final LocationService _locationService;
  Position? _currentPosition;
  bool _isLoading = false;
  String? _error;

  LocationProvider(this._locationService);

  Position? get currentPosition => _currentPosition;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> getCurrentLocation() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _currentPosition = await _locationService.getCurrentLocation();
      if (_currentPosition == null) {
        _error = 'Could not get location. Please check your location settings.';
      }
    } catch (e) {
      _error = 'An error occurred while getting location: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
