import 'package:faba_weather_app/data/services/storage_service.dart';
import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  /// The date will be translated according to the current app locale
  String get _locale => StorageService.getLanguage();

  /// Returns the date in the format "EEEE, MMMM d" (e.g., "Monday, March 21" in English or "Lunes, Marzo 21" in Spanish)
  String get fullDate => DateFormat('EEEE, MMMM d', _locale).format(this);

  /// Returns the date in the format "EEE, MMM d" (e.g., "Mon, Mar 21" in English or "Lun, Mar 21" in Spanish)
  String get shortDate => DateFormat('EEE, MMM d', _locale).format(this);

  /// Returns the date in the format "d MMM" (e.g., "21 Mar" in English or "21 Mar" in Spanish)
  String get dayMonth => DateFormat('d MMM', _locale).format(this);

  /// Returns the day of the week (e.g., "Monday" in English or "Lunes" in Spanish)
  String get dayOfWeek => DateFormat('EEEE', _locale).format(this);

  /// Returns the short day of the week (e.g., "Mon" in English or "Lun" in Spanish)
  String get shortDayOfWeek => DateFormat('EEE', _locale).format(this);

  /// Returns the time in 12-hour format with AM/PM (e.g., "3:45 PM" in English or "3:45 PM" in Spanish)
  String get time12Hour => DateFormat('h:mm a', _locale).format(this);

  /// Returns the time in 24-hour format (e.g., "15:45" in English or "15:45" in Spanish)
  String get time24Hour => DateFormat('HH:mm', _locale).format(this);

  /// Returns the month name (e.g., "March")
  String get monthName => DateFormat('MMMM', _locale).format(this);

  /// Returns the short month name (e.g., "Mar" in English or "Mar" in Spanish)
  String get shortMonthName => DateFormat('MMM', _locale).format(this);

  /// Returns the day of the month (e.g., "21" in English or "21" in Spanish)
  String get dayOfMonth => DateFormat('d', _locale).format(this);

  /// Returns the year (e.g., "2023" in English or "2023" in Spanish)
  String get year => DateFormat('yyyy', _locale).format(this);

  /// Returns a custom formatted date string based on the provided pattern
  String format(String pattern) => DateFormat(pattern, _locale).format(this);
}
