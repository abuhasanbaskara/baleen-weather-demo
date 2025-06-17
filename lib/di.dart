import 'package:baleen_weather_app_test/data/repositories/hive_repository.dart';
import 'package:baleen_weather_app_test/data/repositories/location_repository.dart';
import 'package:baleen_weather_app_test/data/repositories/weather_repository.dart';
import 'package:baleen_weather_app_test/logic/blocs/setting/setting_bloc.dart';
import 'package:get_it/get_it.dart';

import 'logic/blocs/home/home_bloc.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerFactory<SettingBloc>(() => SettingBloc());

  getIt.registerLazySingleton<WeatherRepository>(() => WeatherRepository());
  getIt.registerLazySingleton<LocationRepository>(() => LocationRepository());
  getIt.registerLazySingleton<HiveRepository>(() => HiveRepository());
  getIt.registerFactory<HomeBloc>(() =>
      HomeBloc(
        weatherRepository: getIt<WeatherRepository>(),
        locationRepository: getIt<LocationRepository>(),
        hiveRepository: getIt<HiveRepository>(),
      ));
}