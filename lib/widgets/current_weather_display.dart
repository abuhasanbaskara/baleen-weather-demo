import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CurrentWeatherDisplay extends StatelessWidget {
  final String cityName;         // e.g., "Tokyo"
  final String lottiePath;       // e.g., Assets.rain
  final String temperature;      // e.g., "26°C"
  final String description;      // e.g., "Light rain"
  final bool isCurrentLocation;

  const CurrentWeatherDisplay({
    super.key,
    required this.cityName,
    required this.lottiePath,
    required this.temperature,
    required this.description,
    required this.isCurrentLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
      children: [
        if (isCurrentLocation) ...[
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.my_location,
                size: 20,
              ),
              const SizedBox(width: 4),
              Text(
                AppLocalizations.of(context)!.myLocation,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ],
        const SizedBox(height: 8),
        Text(
          cityName,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Lottie.asset(
          lottiePath,
          width: 200,
          height: 200,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          temperature,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
