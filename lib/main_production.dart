import 'package:baleen_weather_app_test/flavors.dart';
import 'package:flutter/material.dart';
import 'di.dart';
import 'main.dart';

void main() async {
  F.appFlavor = Flavor.production;
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}