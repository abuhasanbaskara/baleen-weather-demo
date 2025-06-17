import 'package:baleen_weather_app_test/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final ValueChanged<String> onSearchChanged;
  final VoidCallback onSettingsTap;
  final TextEditingController controller;
  final VoidCallback? onSearchFocus;
  final VoidCallback? onSearchUnfocus;

  const SearchAppBar({
    super.key,
    required this.onSearchChanged,
    required this.onSettingsTap,
    required this.controller,
    this.onSearchFocus,
    this.onSearchUnfocus,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<SearchAppBar> createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {}); // Rebuild to update close button
      if (_focusNode.hasFocus) {
        widget.onSearchFocus?.call();
      } else {
        widget.onSearchUnfocus?.call();
      }
    });

    widget.controller.addListener(() {
      setState(() {}); // Rebuild to update close button on text change
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _triggerSearch() {
    final text = widget.controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSearchChanged(text);
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
                focusNode: _focusNode,
                controller: widget.controller,
                onSubmitted: (_) => _triggerSearch(),
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.search,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                  filled: true,
                  fillColor: colorScheme.surface,
                  prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _triggerSearch,
                  ),
                  suffixIcon: (_focusNode.hasFocus || widget.controller.text.isNotEmpty)
                      ? IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      widget.controller.clear();
                      _focusNode.unfocus();
                      widget.onSearchUnfocus?.call();
                    },
                  )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withAlpha(77),
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: colorScheme.outline.withAlpha(77),
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
              onPressed: widget.onSettingsTap,
              color: colorScheme.onSurface,
            ),
          ],
        ),
      ),
    );
  }
}

