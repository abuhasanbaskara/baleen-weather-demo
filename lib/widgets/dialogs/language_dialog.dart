import 'package:baleen_weather_app_test/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:baleen_weather_app_test/l10n/app_localizations.dart';

class LanguageDialog extends StatelessWidget {
  final void Function(String localeCode) onLanguageSelected;

  const LanguageDialog({
    super.key,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(AppLocalizations.of(context)!.changeLanguage),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.english),
            onTap: () {
              onLanguageSelected(AppStrings.en);
              Navigator.of(context).pop();
            },
          ),
          const Divider(height: 1),
          ListTile(
            title: Text(AppLocalizations.of(context)!.japanese),
            onTap: () {
              onLanguageSelected(AppStrings.ja);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
