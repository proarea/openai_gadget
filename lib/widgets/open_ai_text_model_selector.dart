import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../deps/blocs/settings_bloc.dart';
import '../models/app_settings.dart';
import '../models/open_ai_text_model.dart';

class OpenAiTextModelSelector extends StatelessWidget {
  final VoidCallback? onChanged;

  const OpenAiTextModelSelector({super.key, this.onChanged});

  void _onChanged(BuildContext context, OpenAiTextModel? value) {
    if (value == null) return;

    BlocProvider.of<SettingsBloc>(context).setModel(value);

    onChanged?.call();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, AppSettings>(
      builder: (context, appSettings) {
        return DropdownButtonHideUnderline(
          child: DropdownButton<OpenAiTextModel>(
            value: appSettings.textModel,
            items: OpenAiTextModel.values
                .map(
                  (textModel) => DropdownMenuItem(
                    value: textModel,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        textModel.modelName,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) => _onChanged(context, value),
          ),
        );
      },
    );
  }
}
