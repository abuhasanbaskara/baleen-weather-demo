import 'package:baleen_weather_app_test/data/repositories/location_repository.dart';
import 'package:baleen_weather_app_test/data/repositories/weather_repository.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_event.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository weatherRepository;
  final LocationRepository locationRepository;

  HomeBloc({
    required this.weatherRepository,
    required this.locationRepository,
  }) : super(const HomeState()) {
    on<GetWeatherByCityName>(_getWeatherByCityName);
    on<ConfirmedCityNotFound>(_confirmedCityNotFound);
    on<GetCurrentLocation>(_getCurrentLocation);
    on<ShowLocationErrorDialogDone>(_showLocationErrorDialogDone);
    on<GetCurrentLocationDone>(_getCurrentLocationDone);
  }

  Future<void> _getWeatherByCityName(
      GetWeatherByCityName event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(
      isWeatherResponseLoading: true,
      errorWeatherResponse: null,
    ));

    try {
      final response = await weatherRepository.getWeatherByCityName(event.cityName);

      if (response.cod == "200") {
        emit(state.copyWith(
          weatherResponse: response,
          isWeatherResponseLoading: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isWeatherResponseLoading: false,
        errorWeatherResponse: e.toString(),
        isCityNotFound: true,
      ));
    }
  }

  void _confirmedCityNotFound(ConfirmedCityNotFound event, Emitter<HomeState> emit) {
    emit(state.copyWith(isCityNotFound: false));
  }

  Future<void> _getCurrentLocation(GetCurrentLocation event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isCurrentLocationLoading: true));
    try {
      final currentPosition = await locationRepository.getAllCurrentLocationInfo();
      emit(state.copyWith(
        lat: currentPosition?.latitude,
        lon: currentPosition?.longitude,
        isCurrentLocationLoading: false,
        isGetCurrentLocationDone: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        isCurrentLocationLoading: false,
        isShowLocationErrorDialog: true,
        isGetCurrentLocationDone: false,
      ));
    }
  }

  void _showLocationErrorDialogDone(ShowLocationErrorDialogDone event, Emitter<HomeState> emit) {
    emit(state.copyWith(isShowLocationErrorDialog: false));
  }

  void _getCurrentLocationDone(GetCurrentLocationDone event, Emitter<HomeState> emit) {
    emit(state.copyWith(isGetCurrentLocationDone: false));
  }
}