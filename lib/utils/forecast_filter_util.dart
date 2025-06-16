import 'package:baleen_weather_app_test/data/models/weather_response.dart';

class ForecastFilterUtil {
  static List<WeatherData> currentFiltered(List<WeatherData> list) {
    if (list.isEmpty) return [];

    final firstDate = list.first.dtTxt?.split(' ').first;
    if (firstDate == null) return [];

    return list.where((item) {
      final itemDate = item.dtTxt?.split(' ').first;
      return itemDate == firstDate;
    }).toList();
  }

  static List<WeatherData> nextDayFiltered(List<WeatherData> list) {
    if (list.isEmpty) return [];

    final firstDate = list.first.dtTxt?.split(' ').first;
    if (firstDate == null) return [];

    return list.where((item) {
      final itemDate = item.dtTxt?.split(' ').first;
      return itemDate != firstDate;
    }).toList();
  }
}
