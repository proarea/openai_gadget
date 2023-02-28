import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../deps/blocs/settings_bloc.dart';
import '../../l10n/l10n.dart';
import '../../models/app_settings.dart';
import '../../models/open_ai_text_model.dart';

class OpenAiTextModelPicker extends StatelessWidget {
  const OpenAiTextModelPicker({super.key});

  void _onPicked(BuildContext context, OpenAiTextModel? option) {
    if (option == null) return;
    BlocProvider.of<SettingsBloc>(context).set(textModel: option);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, AppSettings>(
      builder: (BuildContext context, AppSettings appSettings) {
        return PopupMenuButton<OpenAiTextModel>(
          icon: const Icon(Icons.text_fields_rounded),
          tooltip: context.localizations.tooltipOpenAiTextModelPicker,
          onSelected: (option) => _onPicked(context, option),
          itemBuilder: (BuildContext context) {
            return OpenAiTextModel.values
                .map((option) => _buildEntry(appSettings, option))
                .toList();
          },
        );
      },
    );
  }

  PopupMenuEntry<OpenAiTextModel> _buildEntry(
    AppSettings appSettings,
    OpenAiTextModel option,
  ) {
    return PopupMenuItem<OpenAiTextModel>(
      value: option,
      child: Text(
        option.modelName,
        style: appSettings.textModel == option
            ? const TextStyle(fontWeight: FontWeight.w600)
            : const TextStyle(),
      ),
    );
  }
}
