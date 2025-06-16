import 'package:intl/intl.dart';

class DateFormatterUtil {
  /// Example: "June 15, 2025 at 15:00"
  static String formatFull(String? dtTxt) {
    if (dtTxt == null) return "-";
    try {
      final dateTime = DateTime.parse(dtTxt).toLocal();
      final formatter = DateFormat("MMMM d, y 'at' HH:mm");
      return formatter.format(dateTime);
    } catch (e) {
      return "-";
    }
  }

  /// Example: "June 16, 18:00"
  static String formatSimple(String? dtTxt) {
    if (dtTxt == null) return "-";
    try {
      final dateTime = DateTime.parse(dtTxt).toLocal();
      final formatter = DateFormat("MMMM d, HH:mm");
      return formatter.format(dateTime);
    } catch (e) {
      return "-";
    }
  }

  /// Example: "15"
  static String formatHourOnly(String? dtTxt) {
    if (dtTxt == null) return "-";
    try {
      final dateTime = DateTime.parse(dtTxt).toLocal();
      return dateTime.hour.toString();
    } catch (e) {
      return "-";
    }
  }

}
