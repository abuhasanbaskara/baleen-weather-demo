import 'package:baleen_weather_app_test/data/repositories/weather_repository.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_event.dart';
import 'package:baleen_weather_app_test/logic/blocs/home/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final WeatherRepository weatherRepository;

  HomeBloc({
    required this.weatherRepository,
  }) : super(const HomeState()) {
    on<GetWeatherByCityName>(_getWeatherByCityName);
    on<ConfirmedCityNotFound>(_confirmedCityNotFound);
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

}