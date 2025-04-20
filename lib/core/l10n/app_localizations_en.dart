// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Weather App';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsHeader => 'FABA International\nCase Study';

  @override
  String get temperature => 'Temperature';

  @override
  String get cityLabel => 'City';

  @override
  String get searchHint => 'Search for a city...';

  @override
  String get noResultsFound => 'No results found';

  @override
  String get searching => 'Searching...';

  @override
  String get weatherDetails => 'Weather Details';

  @override
  String get humidity => 'Humidity';

  @override
  String get windSpeed => 'Wind Speed';

  @override
  String get condition => 'Condition';

  @override
  String get todaysForecast => 'Today\'s Forecast';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get temperatureUnit => 'Temperature Unit';

  @override
  String get celsius => 'Celsius';

  @override
  String get fahrenheit => 'Fahrenheit';

  @override
  String get english => 'English';

  @override
  String get spanish => 'Spanish';

  @override
  String get licenses => 'Licenses';

  @override
  String get loading => 'Loading...';

  @override
  String get population => 'Population';

  @override
  String get timezone => 'Timezone';

  @override
  String get sunrise => 'Sunrise';

  @override
  String get sunset => 'Sunset';

  @override
  String get enterCityName => 'Enter a city name';

  @override
  String get error => 'Error: ';

  @override
  String get weatherUpdated => 'Weather updated successfully';

  @override
  String get noRecentSearches => 'No recent searches';

  @override
  String get fiveDayForecast => '5-Day Forecast';

  @override
  String get noData => 'No Data';

  @override
  String searchingFor(String query) {
    return 'Searching for: $query';
  }
}
