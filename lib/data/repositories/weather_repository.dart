import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:baleen_weather_app_test/data/network/api_client.dart';
import 'package:baleen_weather_app_test/flavors.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class WeatherRepository {
  final ApiClient _apiClient = ApiClient();
  final Logger _logger = Logger();

  Future<WeatherResponse> getWeatherByCityName(String cityName) async {
    try {
      final response = await _apiClient.get(
        'forecast',
        queryParameters: {
          'q': cityName,
          'appid': F.appId,
        },
      );

      return WeatherResponse.fromJson(response.data);
    } on DioException catch (e, stackTrace) {
      _logger.e(e);
      _logger.e(stackTrace);
      final errorMessage = e.response?.data['cod'] ?? 'Unknown error';
      throw errorMessage;
    }
  }
}