import 'package:baleen_weather_app_test/data/repositories/hive_repository.dart';
import 'package:baleen_weather_app_test/data/repositories/location_repository.dart';
import 'package:baleen_weather_app_test/data/repositories/weather_repository.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_event.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository weatherRepository;
  final LocationRepository locationRepository;
  final HiveRepository hiveRepository;
  final Logger _logger = Logger();

  HomeBloc({
    required this.weatherRepository,
    required this.locationRepository,
    required this.hiveRepository,
  }) : super(const HomeState()) {
    on<GetWeatherByCityName>(_getWeatherByCityName);
    on<ConfirmedCityNotFound>(_confirmedCityNotFound);
    on<GetCurrentLocation>(_getCurrentLocation);
    on<ShowLocationErrorDialogDone>(_showLocationErrorDialogDone);
    on<GetCurrentLocationDone>(_getCurrentLocationDone);
    on<GetWeatherByLatLon>(_getWeatherByLatLon);
    on<SearchFocus>(_searchFocus);
    on<SearchUnFocus>(_searchUnFocus);
    on<CallSavedWeather>(_callSavedWeather);
    on<ShowSelectedSavedWeather>(_showSelectedSavedWeather);
    on<DeleteSavedWeather>(_deleteSavedWeather);
    on<RefreshSavedWeather>(_refreshSavedWeather);
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

        if (response.city?.name != null) {
          hiveRepository.saveWeatherResponse(response.city!.name!, response);
          add(CallSavedWeather());
        }

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
      final latitude = currentPosition?.latitude;
      final longitude = currentPosition?.longitude;

      emit(state.copyWith(
        isCurrentLocationLoading: false,
        isGetCurrentLocationDone: true,
      ));

      if (latitude != null && longitude != null) {
        add(GetWeatherByLatLon(lat: latitude, lon: longitude));
      }
    } catch (e) {
      emit(state.copyWith(
        isCurrentLocationLoading: false,
        isShowLocationErrorDialog: true,
        isGetCurrentLocationDone: false,
      ));
    }
  }

  Future<void> _getWeatherByLatLon(
      GetWeatherByLatLon event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(
      isWeatherResponseLoading: true,
      errorWeatherResponse: null,
    ));

    try {
      final response = await weatherRepository.getWeatherByLatLon(event.lat, event.lon);
      final updated = response.copyWith(isCurrentLocation: true);

      if (response.cod == "200") {
        hiveRepository.saveWeatherResponse("currentLocation", updated);
        add(CallSavedWeather());

        emit(state.copyWith(
          weatherResponse: updated,
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

  void _showLocationErrorDialogDone(ShowLocationErrorDialogDone event, Emitter<HomeState> emit) {
    emit(state.copyWith(isShowLocationErrorDialog: false));
  }

  void _getCurrentLocationDone(GetCurrentLocationDone event, Emitter<HomeState> emit) {
    emit(state.copyWith(isGetCurrentLocationDone: false));
  }

  void _searchFocus(SearchFocus event, Emitter<HomeState> emit) {
    emit(state.copyWith(isSearchFocus: true));
  }

  void _searchUnFocus(SearchUnFocus event, Emitter<HomeState> emit) {
    emit(state.copyWith(isSearchFocus: false));
  }

  Future<void> _callSavedWeather(CallSavedWeather event, Emitter<HomeState> emit) async {
    try {
      final savedWeatherResponses = await hiveRepository.getSavedWeatherResponses();

      emit(state.copyWith(
        savedWeatherResponses: savedWeatherResponses,
      ));
    } catch (e) {
      _logger.e(e);
    }
  }

  void _showSelectedSavedWeather(ShowSelectedSavedWeather event, Emitter<HomeState> emit) {
    emit(state.copyWith(weatherResponse: event.savedWeatherResponse));
  }

  Future<void> _deleteSavedWeather(DeleteSavedWeather event, Emitter<HomeState> emit) async {
    try {
      if (event.savedWeatherResponse.isCurrentLocation) {
        await hiveRepository.deleteWeatherResponse("currentLocation");
      } else {
        await hiveRepository.deleteWeatherResponse(event.savedWeatherResponse.city?.name ?? "");
      }

      add(CallSavedWeather());
    } catch (e) {
      _logger.e(e);
    }
  }

  Future<void> _refreshSavedWeather(
      RefreshSavedWeather event,
      Emitter<HomeState> emit,
      ) async {
    emit(state.copyWith(
      isWeatherResponseLoading: true,
      errorWeatherResponse: null,
    ));

    try {
      final response = await weatherRepository.getWeatherByCityName(event.savedWeatherResponse.city?.name ?? "");

      if (response.cod == "200") {

        if (event.savedWeatherResponse.isCurrentLocation) {
          final updated = response.copyWith(isCurrentLocation: true);
          hiveRepository.saveWeatherResponse("currentLocation", updated);
        } else if (response.city?.name != null){
          hiveRepository.saveWeatherResponse(response.city!.name!, response);
        }

        add(CallSavedWeather());
        emit(state.copyWith(
          isWeatherResponseLoading: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        isWeatherResponseLoading: false,
        isCityNotFound: true,
      ));
    }
  }
}