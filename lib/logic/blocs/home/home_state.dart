import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final WeatherResponse? weatherResponse;
  final bool isWeatherResponseLoading;
  final String? errorWeatherResponse;
  final bool isCityNotFound;

  const HomeState({
    this.weatherResponse,
    this.isWeatherResponseLoading = false,
    this.errorWeatherResponse,
    this.isCityNotFound = false,
  });

  HomeState copyWith({
    WeatherResponse? weatherResponse,
    bool? isWeatherResponseLoading,
    String? errorWeatherResponse,
    bool? isCityNotFound,
  }) {
    return HomeState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
      isWeatherResponseLoading: isWeatherResponseLoading ?? this.isWeatherResponseLoading,
      errorWeatherResponse: errorWeatherResponse ?? this.errorWeatherResponse,
      isCityNotFound: isCityNotFound ?? this.isCityNotFound,
    );
  }

  @override
  List<Object?> get props => [
    weatherResponse,
    isWeatherResponseLoading,
    errorWeatherResponse,
    isCityNotFound,
  ];
}