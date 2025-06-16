import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:baleen_weather_app_test/flavors.dart';
import 'package:flutter/material.dart';
import 'di.dart';
import 'main.dart';

void main() async {
  F.appFlavor = Flavor.staging;
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}