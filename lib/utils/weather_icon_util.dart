class WeatherIconUtil {
  static String getIconUrl(String? iconCode) {
    if (iconCode == null || iconCode.isEmpty) {
      return 'error';
    }
    return 'https://openweathermap.org/img/wn/$iconCode@2x.png';
  }

  static String getIconUrlSmall(String? iconCode) {
    if (iconCode == null || iconCode.isEmpty) {
      return 'error';
    }
    return 'https://openweathermap.org/img/wn/$iconCode.png';
  }
}
