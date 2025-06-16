import 'package:flutter/material.dart';

class FullScreenLoading extends StatelessWidget {
  const FullScreenLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
        child: const Center(
          child: SizedBox(
            width: 64,
            height: 64,
            child: CircularProgressIndicator(strokeWidth: 6),
          ),
        ),
      ),
    );
  }
}
