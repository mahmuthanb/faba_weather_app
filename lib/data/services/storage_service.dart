import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'app_language';

  static late final SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Set Theme Mode
  static Future<bool> setThemeMode(bool isDark) async {
    return await _prefs.setBool(themeKey, isDark);
  }

  // Get Theme Mode to check if it is dark or light
  static bool getThemeMode() {
    return _prefs.getBool(themeKey) ?? false;
  }

  // Language
  static Future<bool> setLanguage(String languageCode) async {
    return await _prefs.setString(languageKey, languageCode);
  }

  // Get Language that's set in the app before
  static String getLanguage() {
    return _prefs.getString(languageKey) ?? 'en';
  }
}
