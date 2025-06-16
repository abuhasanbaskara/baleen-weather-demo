class StringUtil {
  static String capitalize(String text) {
    return text.isNotEmpty ? '${text[0].toUpperCase()}${text.substring(1)}' : text;
  }
}
