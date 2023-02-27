import 'package:flutter/material.dart';

class ConstrainedArea extends StatelessWidget {
  final Widget child;

  const ConstrainedArea({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1000,
          minWidth: 600,
        ),
        child: child,
      ),
    );
  }
}
