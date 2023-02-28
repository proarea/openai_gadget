import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../deps/blocs/settings_bloc.dart';
import '../l10n/l10n.dart';
import '../models/app_settings.dart';
import '../models/open_ai_text_model.dart';

class DefaultAppBar extends AppBar {
  DefaultAppBar({
    super.key,
    required String title,
    List<Widget> actions = const [],
  }) : super(
          title: Text(title),
          actions: [
            ...actions,
            const _OpenAiTextModelPicker(),
            const _LanguagePicker(),
          ],
        );
}

class _LanguagePicker extends StatelessWidget {
  const _LanguagePicker();

  void _onPicked(BuildContext context, Locale? option) {
    if (option == null) return;
    BlocProvider.of<SettingsBloc>(context).set(locale: option);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, AppSettings>(
      builder: (BuildContext context, AppSettings appSettings) {
        return PopupMenuButton<Locale>(
          icon: const Icon(Icons.language),
          tooltip: context.localizations.tooltipLanguagePicker,
          onSelected: (option) => _onPicked(context, option),
          itemBuilder: (BuildContext context) {
            return AppLocalizations.supportedLocales
                .map((option) => _buildEntry(appSettings, option))
                .toList();
          },
        );
      },
    );
  }

  PopupMenuEntry<Locale> _buildEntry(AppSettings appSettings, Locale option) {
    return PopupMenuItem<Locale>(
      value: option,
      child: Text(
        option.languageCode,
        style: appSettings.locale == option
            ? const TextStyle(fontWeight: FontWeight.w600)
            : const TextStyle(),
      ),
    );
  }
}

class _OpenAiTextModelPicker extends StatelessWidget {
  const _OpenAiTextModelPicker();

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
      AppSettings appSettings, OpenAiTextModel option) {
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
