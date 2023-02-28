import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../deps/blocs/settings_bloc.dart';
import '../../l10n/l10n.dart';
import '../../models/app_settings.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({super.key});

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
      child: Builder(
        builder: (context) {
          final localizations = lookupAppLocalizations(option);
          return Text(
            localizations.langName,
            style: appSettings.locale == option
                ? const TextStyle(fontWeight: FontWeight.w600)
                : const TextStyle(),
          );
        },
      ),
    );
  }
}
