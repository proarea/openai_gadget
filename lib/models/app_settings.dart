import 'dart:ui';

import 'open_ai_text_model.dart';

class AppSettings {
  final OpenAiTextModel textModel;
  final Locale locale;

  const AppSettings({
    required this.textModel,
    required this.locale,
  });

  AppSettings.defaults(List<Locale> supportedLocales)
      : textModel = OpenAiTextModel.davinci,
        locale = supportedLocales.first;

  AppSettings copyWith({
    OpenAiTextModel? textModel,
    Locale? locale,
  }) {
    return AppSettings(
      textModel: textModel ?? this.textModel,
      locale: locale ?? this.locale,
    );
  }

  @override
  bool operator ==(covariant AppSettings other) {
    if (identical(this, other)) return true;

    return other.textModel == textModel && other.locale == locale;
  }

  @override
  int get hashCode => textModel.hashCode ^ locale.hashCode;
}
