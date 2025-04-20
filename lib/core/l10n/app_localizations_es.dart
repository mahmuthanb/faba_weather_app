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

  @override
  String get searchHint => 'Buscar una ciudad...';

  @override
  String get noResultsFound => 'No se encontraron resultados';

  @override
  String get searching => 'Buscando...';

  @override
  String get weatherDetails => 'Detalles del Tiempo';

  @override
  String get humidity => 'Humedad';

  @override
  String get windSpeed => 'Velocidad del Viento';

  @override
  String get condition => 'Condición';

  @override
  String get todaysForecast => 'Pronóstico de Hoy';

  @override
  String get darkMode => 'Modo Oscuro';

  @override
  String get language => 'Idioma';

  @override
  String get temperatureUnit => 'Unidad de Temperatura';

  @override
  String get celsius => 'Celsius';

  @override
  String get fahrenheit => 'Fahrenheit';

  @override
  String get english => 'Inglés';

  @override
  String get spanish => 'Español';

  @override
  String get licenses => 'Licencias';

  @override
  String get loading => 'Cargando...';

  @override
  String get population => 'Población';

  @override
  String get timezone => 'Zona Horaria';

  @override
  String get sunrise => 'Amanecer';

  @override
  String get sunset => 'Atardecer';

  @override
  String get enterCityName => 'Ingrese el nombre de una ciudad';

  @override
  String get error => 'Error: ';

  @override
  String get weatherUpdated => 'El tiempo se actualizó correctamente';

  @override
  String get noRecentSearches => 'No hay búsquedas recientes';

  @override
  String get fiveDayForecast => 'Pronóstico de 5 Días';

  @override
  String get noData => 'Sin Datos';

  @override
  String searchingFor(String query) {
    return 'Buscando: $query';
  }
}
