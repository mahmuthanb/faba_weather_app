import 'package:faba_weather_app/data/services/storage_service.dart';
import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  late String _languageCode;

  LanguageProvider() {
    _languageCode = StorageService.getLanguage();
  }

  String get languageCode => _languageCode;
  Locale get locale => Locale(_languageCode);

  void setLanguage(String languageCode) async {
    _languageCode = languageCode;
    await StorageService.setLanguage(languageCode);
    notifyListeners();
  }

  static const List<Locale> supportedLocales = [Locale('en'), Locale('es')];
}
