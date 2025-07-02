import 'package:intl/intl.dart';

extension DateFormatting on String {
  /// Parses ISO 8601 string to a readable format like "June 29, 2025"
  String isoToReadableDate() {
    try {
      final date = DateTime.parse(this);
      return DateFormat.yMMMMd().format(date);
    } catch (_) {
      return this; // fallback if invalid format
    }
  }
}
