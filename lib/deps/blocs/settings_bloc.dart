import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../l10n/app_localizations.dart';
import '../../models/app_settings.dart';
import '../../models/open_ai_text_model.dart';

class SettingsBloc extends Cubit<AppSettings> {
  SettingsBloc()
      : super(
          AppSettings.defaults(AppLocalizations.supportedLocales),
        );

  void set({OpenAiTextModel? textModel, Locale? locale}) {
    final newState = state.copyWith(
      textModel: textModel,
      locale: locale,
    );
    if (state == newState) return;

    if (isClosed) return;
    emit(newState);
  }
}
