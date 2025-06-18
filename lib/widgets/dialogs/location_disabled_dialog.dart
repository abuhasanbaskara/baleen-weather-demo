import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class LocationDisabledDialog extends StatelessWidget {
  final VoidCallback onOpenSettings;
  final VoidCallback onDismiss;

  const LocationDisabledDialog({
    super.key,
    required this.onOpenSettings,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      backgroundColor: colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        AppLocalizations.of(context)!.locationDisabled,
        style: theme.textTheme.titleLarge,
      ),
      content: Text(
        AppLocalizations.of(context)!.pleaseEnableLocation,
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: onDismiss,
          child: Text(
            AppLocalizations.of(context)!.later,
            style: TextStyle(color: colorScheme.primary),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
          onPressed: onOpenSettings,
          child: Text(AppLocalizations.of(context)!.settings),
        ),
      ],
    );
  }
}
