import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:baleen_weather_app_test/flavors.dart';
import 'package:baleen_weather_app_test/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'di.dart';
import 'main.dart';

void main() async {
  F.appFlavor = Flavor.staging;
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  // Init hive and open the box (saved data)
  await Hive.initFlutter();
  Hive.registerAdapter(WeatherResponseAdapter());
  Hive.registerAdapter(WeatherDataAdapter());
  Hive.registerAdapter(MainAdapter());
  Hive.registerAdapter(WeatherAdapter());
  Hive.registerAdapter(CloudsAdapter());
  Hive.registerAdapter(WindAdapter());
  Hive.registerAdapter(RainAdapter());
  Hive.registerAdapter(SysAdapter());
  Hive.registerAdapter(CityAdapter());
  Hive.registerAdapter(CoordAdapter());
  await Hive.openBox<WeatherResponse>(AppStrings.hiveBoxKey);

  runApp(MyApp(savedThemeMode: savedThemeMode));
}