import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String themeKey = 'theme_mode';
  static const String languageKey = 'app_language';
  static const String temperatureUnitKey = 'temperature_unit';
  static const String recentSearchesKey = 'recent_searches';
  static const int maxRecentSearches = 5;

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

  // Temperature Unit
  static Future<bool> setTemperatureUnit(String unit) async {
    return await _prefs.setString(temperatureUnitKey, unit);
  }

  static String getTemperatureUnit() {
    return _prefs.getString(temperatureUnitKey) ?? 'metric';
  }

  // Recent Searches
  static Future<List<String>> getRecentSearches() async {
    return _prefs.getStringList(recentSearchesKey) ?? [];
  }

  static Future<void> addRecentSearch(String search) async {
    if (search.isEmpty) return;

    final searches = await getRecentSearches();

    // Remove if already exists to avoid duplicates
    searches.remove(search);

    // Add to the beginning of the list
    searches.insert(0, search);

    // Keep only the most recent searches
    if (searches.length > maxRecentSearches) {
      searches.removeLast();
    }

    await _prefs.setStringList(recentSearchesKey, searches);
  }

  static Future<void> clearRecentSearches() async {
    await _prefs.remove(recentSearchesKey);
  }
}
