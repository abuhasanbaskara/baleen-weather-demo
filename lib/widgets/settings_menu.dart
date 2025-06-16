import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class SettingsMenu extends StatelessWidget {
  final VoidCallback onChangeLanguageTap;

  const SettingsMenu({
    super.key,
    required this.onChangeLanguageTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = AdaptiveTheme.of(context).mode.isDark;

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16), // reduced bottom margin
      padding: const EdgeInsets.only(top: 8), // only top padding
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: colorScheme.outline.withValues(alpha:  0.2),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildListTile(
            context,
            title: 'Theme',
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Light'),
                const SizedBox(width: 10),
                Switch(
                  value: isDark,
                  onChanged: (value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                ),
                const SizedBox(width: 10),
                const Text('Dark'),
              ],
            ),
          ),
          const Divider(height: 1),
          _buildListTile(
            context,
            title: 'Change Language',
            onTap: onChangeLanguageTap,
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, {
        required String title,
        Widget? trailing,
        VoidCallback? onTap,
      }) {
    final theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      title: Text(
        title,
        style: theme.textTheme.bodyLarge,
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
