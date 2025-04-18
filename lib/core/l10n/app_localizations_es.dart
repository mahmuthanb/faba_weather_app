// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Aplicación del Tiempo';

  @override
  String get settingsTitle => 'Ajustes';

  @override
  String get settingsHeader => 'FABA International\nEstudio de caso';

  @override
  String get temperature => 'Temperatura';

  @override
  String get cityLabel => 'Ciudad';
}
