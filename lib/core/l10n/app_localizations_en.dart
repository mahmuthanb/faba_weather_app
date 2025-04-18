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
}
