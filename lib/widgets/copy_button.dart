import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../l10n/l10n.dart';

class CopyButton extends StatelessWidget {
  final String text;
  final double? size;
  final bool enabled;

  const CopyButton({
    super.key,
    required this.text,
    this.size,
    this.enabled = true,
  });

  void _onCopy(BuildContext context) async {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.localizations.labelTextCopied),
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.transparent,
      child: IconButton(
        icon: Icon(
          Icons.copy,
          size: size,
        ),
        splashRadius: size == null ? null : size! * 1.2,
        onPressed: enabled ? () => _onCopy(context) : null,
      ),
    );
  }
}
