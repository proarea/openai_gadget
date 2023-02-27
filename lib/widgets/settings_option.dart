import 'package:flutter/material.dart';

class SettingsOption extends StatelessWidget {
  final String label;
  final Widget child;
  final EdgeInsetsGeometry margin;

  const SettingsOption({
    super.key,
    required this.label,
    required this.child,
    this.margin = const EdgeInsets.all(8),
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: margin,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
