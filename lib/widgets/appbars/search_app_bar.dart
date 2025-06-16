import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSettingsTap;
  final TextEditingController controller;

  const SearchAppBar({
    super.key,
    required this.onSearchChanged,
    required this.onSettingsTap,
    required this.controller,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _triggerSearch() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      onSearchChanged(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AppBar(
      titleSpacing: 0,
      title: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: controller,
                onSubmitted: (_) => _triggerSearch(),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.search,
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  filled: true,
                  fillColor: colorScheme.surface, // adaptive to theme
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _triggerSearch,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withValues(alpha: 0.3),
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: colorScheme.primary,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: onSettingsTap,
              color: colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}
