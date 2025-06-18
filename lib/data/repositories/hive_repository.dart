import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:baleen_weather_app_test/utils/app_strings.dart';
import 'package:hive/hive.dart';

class HiveRepository {
  final Box<WeatherResponse> _weatherBox = Hive.box<WeatherResponse>(AppStrings.hiveBoxKey);

  Future<List<WeatherResponse>> getSavedWeatherResponses() async {
    final List<WeatherResponse> weatherList = [];

    // Add "currentLocation" first, if exists
    if (_weatherBox.containsKey(AppStrings.hiveCurrentLocation)) {
      final current = _weatherBox.get(AppStrings.hiveCurrentLocation);
      if (current != null) {
        weatherList.add(current);
      }
    }

    // Add the rest
    for (final key in _weatherBox.keys) {
      if (key != AppStrings.hiveCurrentLocation) {
        final item = _weatherBox.get(key);
        if (item != null) {
          weatherList.add(item);
        }
      }
    }

    return weatherList;
  }

  Future<WeatherResponse?> getCurrentSavedInfo() async {
    return _weatherBox.get(AppStrings.hiveCurrentLocation);
  }

  Future<void> saveWeatherResponse(String key, WeatherResponse data) async {
    await _weatherBox.put(key, data);
  }

  Future<void> deleteWeatherResponse(String key) async {
    await _weatherBox.delete(key);
  }
}
