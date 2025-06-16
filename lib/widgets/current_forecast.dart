import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:baleen_weather_app_test/utils/date_formatter_util.dart';
import 'package:baleen_weather_app_test/utils/temperature_util.dart';
import 'package:baleen_weather_app_test/utils/weather_icon_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CurrentForecast extends StatelessWidget {
  final List<WeatherData> forecasts;

  const CurrentForecast({super.key, required this.forecasts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormatterUtil.formatFull(forecasts[0].dtTxt),
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
                    ? "Now"
                    : DateFormatterUtil.formatHourOnly(item.dtTxt);

                return Column(
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
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                      fadeInDuration: const Duration(seconds: 3),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      TemperatureUtil.kelvinToCelsius(item.main?.temp),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
