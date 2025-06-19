import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:baleen_weather_app_test/utils/date_formatter_util.dart';
import 'package:baleen_weather_app_test/utils/number_formatter_util.dart';
import 'package:baleen_weather_app_test/utils/temperature_util.dart';
import 'package:baleen_weather_app_test/widgets/info_tile.dart';
import 'package:flutter/material.dart';

class WeatherDetailSheet extends StatelessWidget {
  final WeatherData weather;

  const WeatherDetailSheet({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final iconColor = colorScheme.onSurface;

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
          ),
          child: ListView(
            controller: scrollController,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: colorScheme.outline.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Text(
                DateFormatterUtil.formatFull(weather.dtTxt, context),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 16),

              InfoTile(
                icon: Icons.thermostat,
                label: AppLocalizations.of(context)!.temperature,
                value: TemperatureUtil.kelvinToCelsius(weather.main?.temp),
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.device_thermostat,
                label: AppLocalizations.of(context)!.feelsLike,
                value: TemperatureUtil.kelvinToCelsius(weather.main?.feelsLike),
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.arrow_downward,
                label: AppLocalizations.of(context)!.minTemp,
                value: TemperatureUtil.kelvinToCelsius(weather.main?.tempMin),
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.arrow_upward,
                label: AppLocalizations.of(context)!.maxTemp,
                value: TemperatureUtil.kelvinToCelsius(weather.main?.tempMax),
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.water_drop,
                label: AppLocalizations.of(context)!.humidity,
                value: "${weather.main?.humidity ?? '-'}%",
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.compress,
                label: AppLocalizations.of(context)!.pressure,
                value: "${weather.main?.pressure ?? '-'} hPa",
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.waves,
                label: AppLocalizations.of(context)!.seaLevel,
                value: "${weather.main?.seaLevel ?? '-'} hPa",
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.landscape,
                label: AppLocalizations.of(context)!.groundLevel,
                value: "${weather.main?.grndLevel ?? '-'} hPa",
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.cloud,
                label: AppLocalizations.of(context)!.clouds,
                value: "${weather.clouds?.all ?? '-'}%",
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.remove_red_eye,
                label: AppLocalizations.of(context)!.visibility,
                value: "${weather.visibility ?? '-'} m",
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.air,
                label: AppLocalizations.of(context)!.windSpeed,
                value: NumberFormatterUtil.formatDouble(weather.wind?.speed, unit: " m/s"),
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.navigation,
                label: AppLocalizations.of(context)!.windDirection,
                value: "${weather.wind?.deg ?? '-'}°",
                iconColor: iconColor,
              ),
              const SizedBox(height: 8),

              InfoTile(
                icon: Icons.flash_on,
                label: AppLocalizations.of(context)!.windGust,
                value: NumberFormatterUtil.formatDouble(weather.wind?.gust, unit: " m/s"),
                iconColor: iconColor,
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
