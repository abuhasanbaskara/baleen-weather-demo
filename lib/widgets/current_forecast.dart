import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:baleen_weather_app_test/utils/date_formatter_util.dart';
import 'package:baleen_weather_app_test/utils/temperature_util.dart';
import 'package:baleen_weather_app_test/utils/weather_icon_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CurrentForecast extends StatelessWidget {
  final List<WeatherData> forecasts;
  final ValueChanged<WeatherData>? onItemTap;

  const CurrentForecast({
    super.key,
    required this.forecasts,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withAlpha(51),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormatterUtil.formatFull(forecasts[0].dtTxt, context),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Divider(),
          SizedBox(
            height: 110,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: forecasts.length,
              separatorBuilder: (_, __) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                final item = forecasts[index];
                final isNow = index == 0;
                final dateLabel = isNow
                    ? AppLocalizations.of(context)!.now
                    : DateFormatterUtil.formatHourOnly(item.dtTxt);

                return GestureDetector(
                  onTap: () {
                    if (onItemTap != null) {
                      onItemTap!(item);
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        dateLabel,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      CachedNetworkImage(
                        imageUrl: WeatherIconUtil.getIconUrlSmall(item.weather?[0].icon),
                        placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                        width: 40,
                        height: 40,
                        fadeInDuration: const Duration(seconds: 1),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        TemperatureUtil.kelvinToCelsius(item.main?.temp),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
