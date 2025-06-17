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
        'Location is disabled',
        style: theme.textTheme.titleLarge,
      ),
      content: Text(
        'Please enable location services in settings to use this feature.',
        style: theme.textTheme.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: onDismiss,
          child: Text(
            'Later',
            style: TextStyle(color: colorScheme.primary),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
          ),
          onPressed: onOpenSettings,
          child: const Text('Settings'),
        ),
      ],
    );
  }
}
