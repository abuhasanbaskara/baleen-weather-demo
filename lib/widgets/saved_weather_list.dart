import 'package:baleen_weather_app_test/data/models/weather_response.dart';
import 'package:baleen_weather_app_test/utils/string_util.dart';
import 'package:baleen_weather_app_test/utils/temperature_util.dart';
import 'package:baleen_weather_app_test/utils/weather_icon_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SavedWeatherList extends StatelessWidget {
  final List<WeatherResponse> savedWeatherResponse;
  final ValueChanged<WeatherResponse> onTapItem;
  final ValueChanged<WeatherResponse> onReloadItem;
  final ValueChanged<WeatherResponse> onDeleteItem;

  const SavedWeatherList({
    super.key,
    required this.savedWeatherResponse,
    required this.onTapItem,
    required this.onReloadItem,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: savedWeatherResponse.map((item) {
        return GestureDetector(
          onTap: () => onTapItem(item),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: Theme.of(context).colorScheme.outline.withAlpha(51),
              ),
            ),
            child: Row(
              children: [
                // LEFT: City Info & Weather Description
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          if (item.isCurrentLocation == true)
                            const Icon(Icons.my_location, size: 16),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              "${item.city?.name}, ${item.city?.country}",
                              style: Theme.of(context).textTheme.bodyLarge,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: WeatherIconUtil.getIconUrlSmall(
                              item.list?[0].weather?[0].icon,
                            ),
                            placeholder: (context, url) =>
                            const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(strokeWidth: 2)),
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                            width: 24,
                            height: 24,
                            fadeInDuration: const Duration(seconds: 1),
                          ),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              StringUtil.capitalize(item.list?[0].weather?[0].description ?? '-'),
                              style: Theme.of(context).textTheme.bodyMedium,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // CENTER: Temperature
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      TemperatureUtil.kelvinToCelsius(item.list?[0].main?.temp),
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ),

                // RIGHT: Reload + Delete
                Column(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      tooltip: "Reload",
                      onPressed: () => onReloadItem(item),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      tooltip: "Delete",
                      onPressed: () => onDeleteItem(item),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}