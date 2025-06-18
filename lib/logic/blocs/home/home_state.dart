import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final WeatherResponse? weatherResponse;
  final bool isWeatherResponseLoading;
  final String? errorMessage;
  final bool isError;

  final bool isCurrentLocationLoading;
  final bool isShowLocationErrorDialog;

  final bool isSearchFocus;
  final List<WeatherResponse>? savedWeatherResponses;
  final bool isShowToast;

  const HomeState({
    this.weatherResponse,
    this.isWeatherResponseLoading = false,
    this.errorMessage,
    this.isError = false,
    this.isCurrentLocationLoading = false,
    this.isShowLocationErrorDialog = false,
    this.isSearchFocus = false,
    this.savedWeatherResponses,
    this.isShowToast = false,
  });

  HomeState copyWith({
    WeatherResponse? weatherResponse,
    bool? isWeatherResponseLoading,
    String? errorMessage,
    bool? isError,
    double? lat,
    double? lon,
    bool? isCurrentLocationLoading,
    bool? isShowLocationErrorDialog,
    bool? isGetCurrentLocationDone,
    bool? isSearchFocus,
    List<WeatherResponse>? savedWeatherResponses,
    bool? isShowToast,
  }) {
    return HomeState(
      weatherResponse: weatherResponse ?? this.weatherResponse,
      isWeatherResponseLoading: isWeatherResponseLoading ?? this.isWeatherResponseLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isError: isError ?? this.isError,
      isCurrentLocationLoading: isCurrentLocationLoading ?? this.isCurrentLocationLoading,
      isShowLocationErrorDialog: isShowLocationErrorDialog ?? this.isShowLocationErrorDialog,
      isSearchFocus: isSearchFocus ?? this.isSearchFocus,
      savedWeatherResponses: savedWeatherResponses ?? this.savedWeatherResponses,
      isShowToast: isShowToast ?? this.isShowToast,
    );
  }

  @override
  List<Object?> get props => [
    weatherResponse,
    isWeatherResponseLoading,
    errorMessage,
    isError,
    isCurrentLocationLoading,
    isShowLocationErrorDialog,
    isSearchFocus,
    savedWeatherResponses,
    isShowToast,
  ];
}