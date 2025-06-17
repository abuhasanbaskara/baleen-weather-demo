import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetWeatherByCityName extends HomeEvent {
  final String cityName;

  GetWeatherByCityName({required this.cityName});

  @override
  List<Object> get props => [cityName];
}

class ConfirmedCityNotFound extends HomeEvent {
  @override
  List<Object> get props => [];
}

class GetWeatherByLatLon extends HomeEvent {
  final double lat;
  final double lon;

  GetWeatherByLatLon({
    required this.lat,
    required this.lon,
  });

  @override
  List<Object> get props => [lat, lon];
}

class GetCurrentLocation extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ShowLocationErrorDialogDone extends HomeEvent {
  @override
  List<Object> get props => [];
}

class GetCurrentLocationDone extends HomeEvent {
  @override
  List<Object> get props => [];
}

class SearchFocus extends HomeEvent {
  @override
  List<Object> get props => [];
}

class SearchUnFocus extends HomeEvent {
  @override
  List<Object> get props => [];
}

class CallSavedWeather extends HomeEvent {
  @override
  List<Object> get props => [];
}

class ShowSelectedSavedWeather extends HomeEvent {
  final WeatherResponse savedWeatherResponse;

  ShowSelectedSavedWeather({required this.savedWeatherResponse});

  @override
  List<Object> get props => [savedWeatherResponse];
}

class DeleteSavedWeather extends HomeEvent {
  final WeatherResponse savedWeatherResponse;

  DeleteSavedWeather({required this.savedWeatherResponse});

  @override
  List<Object> get props => [savedWeatherResponse];
}
