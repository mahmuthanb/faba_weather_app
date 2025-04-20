import 'package:faba_weather_app/data/services/storage_service.dart';

// This is a global variable to control the mock behavior
String mockTemperatureUnit = 'metric';

// Extension to override the static method
extension StorageServiceMock on StorageService {
  static String getTemperatureUnit() {
    return mockTemperatureUnit;
  }
}
