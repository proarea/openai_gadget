import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../deps/blocs/settings_bloc.dart';
import '../../l10n/l10n.dart';
import '../../models/app_settings.dart';
import '../../pages/settings_open_ai_model_page.dart';

class OpenAiModelPicker extends StatelessWidget {
  const OpenAiModelPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, AppSettings>(
      builder: (BuildContext context, AppSettings appSettings) {
        return IconButton(
          icon: const Icon(Icons.text_fields_rounded),
          tooltip: context.localizations.tooltipOpenAiTextModelPicker,
          onPressed: () => Navigator.of(context).push(
            SettingsOpenAiModelPage.createRoute(),
          ),
        );
      },
    );
  }
}
