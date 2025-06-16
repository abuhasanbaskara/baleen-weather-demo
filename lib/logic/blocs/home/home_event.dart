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
