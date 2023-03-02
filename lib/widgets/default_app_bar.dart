import 'package:flutter/material.dart';

import 'settings/language_picker.dart';
import 'settings/open_ai_model_picker.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({
    super.key,
    required String title,
    List<Widget> actions = const [],
  }) : super(
          title: Text(title),
          actions: [
            ...actions,
            const OpenAiModelPicker(),
            const LanguagePicker(),
          ],
        );

  DefaultAppBar.noActions({
    super.key,
    required String title,
    List<Widget> actions = const [],
  }) : super(
          title: Text(title),
        );
}
