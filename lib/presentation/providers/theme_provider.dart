import 'package:flutter/material.dart';
import 'package:faba_weather_app/data/services/storage_services.dart';
import 'package:provider/provider.dart';

class ThemeProvider with ChangeNotifier {
  late bool _isDarkMode;

  ThemeProvider() {
    _isDarkMode = StorageService.getThemeMode();
  }

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;
  bool get isDarkMode => _isDarkMode;

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await StorageService.setThemeMode(_isDarkMode);
    notifyListeners();
  }
}

final themeProvider = ChangeNotifierProvider<ThemeProvider>(
  create: (context) => ThemeProvider(),
);
