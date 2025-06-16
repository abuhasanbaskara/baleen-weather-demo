import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:baleen_weather_app_test/utils/date_formatter_util.dart';
import 'package:baleen_weather_app_test/utils/string_util.dart';
import 'package:baleen_weather_app_test/utils/temperature_util.dart';
import 'package:baleen_weather_app_test/utils/weather_icon_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FiveDayForecast extends StatelessWidget {
  final List<WeatherData> forecasts;

  const FiveDayForecast({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha : 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.fiveDayForecast,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Divider(),
          ...forecasts.map((item) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Text(
                          DateFormatterUtil.formatSimple(item.dtTxt),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                    ),
                    CachedNetworkImage(
                      imageUrl: WeatherIconUtil.getIconUrl(item.weather?[0].icon),
                      placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fadeInDuration: const Duration(seconds: 3),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          TemperatureUtil.kelvinToCelsius(item.main?.temp),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                    ),
                    Expanded(
                        flex: 4,
                        child: Text(
                          StringUtil.capitalize(item.weather?[0].description ?? "Unknown description"),
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                    ),
                  ],
                ),
                const Divider(),
              ],
            );
          }),
        ],
      ),
    );
  }
}
