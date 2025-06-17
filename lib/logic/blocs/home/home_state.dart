import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final WeatherResponse? weatherResponse;
  final bool isWeatherResponseLoading;
  final String? errorWeatherResponse;
  final bool isCityNotFound;

  final bool isCurrentLocationLoading;
  final bool isShowLocationErrorDialog;
  final bool isGetCurrentLocationDone;

  final bool isSearchFocus;
  final List<WeatherResponse>? savedWeatherResponses;

  const HomeState({
    this.weatherResponse,
    this.isWeatherResponseLoading = false,
    this.errorWeatherResponse,
    this.isCityNotFound = false,
    this.isCurrentLocationLoading = false,
    this.isShowLocationErrorDialog = false,
    this.isGetCurrentLocationDone = false,
    this.isSearchFocus = false,
    this.savedWeatherResponses,
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
    bool? isSearchFocus,
    List<WeatherResponse>? savedWeatherResponses,
  }) {
    return HomeState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
      isWeatherResponseLoading: isWeatherResponseLoading ?? this.isWeatherResponseLoading,
      errorWeatherResponse: errorWeatherResponse ?? this.errorWeatherResponse,
      isCityNotFound: isCityNotFound ?? this.isCityNotFound,
      isCurrentLocationLoading: isCurrentLocationLoading ?? this.isCurrentLocationLoading,
      isShowLocationErrorDialog: isShowLocationErrorDialog ?? this.isShowLocationErrorDialog,
      isGetCurrentLocationDone: isGetCurrentLocationDone ?? this.isGetCurrentLocationDone,
      isSearchFocus: isSearchFocus ?? this.isSearchFocus,
      savedWeatherResponses: savedWeatherResponses ?? this.savedWeatherResponses,
    );
  }

  @override
  List<Object?> get props => [
    weatherResponse,
    isWeatherResponseLoading,
    errorWeatherResponse,
    isCityNotFound,
    isCurrentLocationLoading,
    isShowLocationErrorDialog,
    isGetCurrentLocationDone,
    isSearchFocus,
    savedWeatherResponses,
  ];
}