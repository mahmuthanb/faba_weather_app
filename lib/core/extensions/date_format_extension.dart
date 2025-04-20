import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  /// Returns the date in the format "EEEE, MMMM d" (e.g., "Monday, March 21")
  String get fullDate => DateFormat('EEEE, MMMM d').format(this);

  /// Returns the date in the format "EEE, MMM d" (e.g., "Mon, Mar 21")
  String get shortDate => DateFormat('EEE, MMM d').format(this);

  /// Returns the date in the format "d MMM" (e.g., "21 Mar")
  String get dayMonth => DateFormat('d MMM').format(this);

  /// Returns the day of the week (e.g., "Monday")
  String get dayOfWeek => DateFormat('EEEE').format(this);

  /// Returns the short day of the week (e.g., "Mon")
  String get shortDayOfWeek => DateFormat('EEE').format(this);

  /// Returns the time in 12-hour format with AM/PM (e.g., "3:45 PM")
  String get time12Hour => DateFormat('h:mm a').format(this);

  /// Returns the time in 24-hour format (e.g., "15:45")
  String get time24Hour => DateFormat('HH:mm').format(this);

  /// Returns the month name (e.g., "March")
  String get monthName => DateFormat('MMMM').format(this);

  /// Returns the short month name (e.g., "Mar")
  String get shortMonthName => DateFormat('MMM').format(this);

  /// Returns the day of the month (e.g., "21")
  String get dayOfMonth => DateFormat('d').format(this);

  /// Returns the year (e.g., "2023")
  String get year => DateFormat('yyyy').format(this);

  /// Returns a custom formatted date string based on the provided pattern
  String format(String pattern) => DateFormat(pattern).format(this);
}
