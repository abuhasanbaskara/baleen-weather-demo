import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:hive/hive.dart';

class HiveRepository {
  final Box<WeatherResponse> _weatherBox = Hive.box<WeatherResponse>('weatherBox');

  Future<List<WeatherResponse>> getSavedWeatherResponses() async {
    final List<WeatherResponse> weatherList = [];

    // Add "currentLocation" first, if exists
    if (_weatherBox.containsKey('currentLocation')) {
      final current = _weatherBox.get('currentLocation');
      if (current != null) {
        weatherList.add(current);
      }
    }

    // Add the rest
    for (final key in _weatherBox.keys) {
      if (key != 'currentLocation') {
        final item = _weatherBox.get(key);
        if (item != null) {
          weatherList.add(item);
        }
      }
    }

    return weatherList;
  }

  Future<void> saveWeatherResponse(String key, WeatherResponse data) async {
    await _weatherBox.put(key, data);
  }

  Future<void> deleteWeatherResponse(String key) async {
    await _weatherBox.delete(key);
  }
}
