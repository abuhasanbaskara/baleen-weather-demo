import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final WeatherResponse? weatherResponse;
  final bool isWeatherResponseLoading;
  final String? errorWeatherResponse;
  final bool isCityNotFound;

  final double? lat;
  final double? lon;
  final bool isCurrentLocationLoading;
  final bool isShowLocationErrorDialog;
  final bool isGetCurrentLocationDone;

  const HomeState({
    this.weatherResponse,
    this.isWeatherResponseLoading = false,
    this.errorWeatherResponse,
    this.isCityNotFound = false,
    this.lat,
    this.lon,
    this.isCurrentLocationLoading = false,
    this.isShowLocationErrorDialog = false,
    this.isGetCurrentLocationDone = false,
  });

  HomeState copyWith({
    WeatherResponse? weatherResponse,
    bool? isWeatherResponseLoading,
    String? errorWeatherResponse,
    bool? isCityNotFound,
    double? lat,
    double? lon,
    bool? isCurrentLocationLoading,
    bool? isShowLocationErrorDialog,
    bool? isGetCurrentLocationDone,
  }) {
    return HomeState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
      isWeatherResponseLoading: isWeatherResponseLoading ?? this.isWeatherResponseLoading,
      errorWeatherResponse: errorWeatherResponse ?? this.errorWeatherResponse,
      isCityNotFound: isCityNotFound ?? this.isCityNotFound,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      isCurrentLocationLoading: isCurrentLocationLoading ?? this.isCurrentLocationLoading,
      isShowLocationErrorDialog: isShowLocationErrorDialog ?? this.isShowLocationErrorDialog,
      isGetCurrentLocationDone: isGetCurrentLocationDone ?? this.isGetCurrentLocationDone,
    );
  }

  @override
  List<Object?> get props => [
    weatherResponse,
    isWeatherResponseLoading,
    errorWeatherResponse,
    isCityNotFound,
    lat,
    lon,
    isCurrentLocationLoading,
    isShowLocationErrorDialog,
    isGetCurrentLocationDone,
  ];
}