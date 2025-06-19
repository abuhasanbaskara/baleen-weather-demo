class NumberFormatterUtil {
  /// Format a double with 1 decimal place and optional unit
  /// Example 3.14159 -> 3.1
  static String formatDouble(double? value, {String unit = ""}) {
    return value != null ? "${value.toStringAsFixed(1)}$unit" : "-";
  }
}
