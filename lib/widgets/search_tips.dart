import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:baleen_weather_app_test/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SearchTips extends StatelessWidget {
  const SearchTips({super.key});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            Assets.search,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.searchTips,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
