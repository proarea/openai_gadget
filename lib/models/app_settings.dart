import 'dart:ui';

import '../generated/openai_models.dart';
import 'open_ai_model.dart';

class AppSettings {
  final OpenAiModel openAiModel;
  final Locale locale;

  const AppSettings({
    required this.openAiModel,
    required this.locale,
  });

  AppSettings.defaults(List<Locale> supportedLocales)
      : openAiModel = GeneratedOpenAiModels.textModels.first,
        locale = supportedLocales.first;

  AppSettings copyWith({
    OpenAiModel? openAiModel,
    Locale? locale,
  }) {
    return AppSettings(
      openAiModel: openAiModel ?? this.openAiModel,
      locale: locale ?? this.locale,
    );
  }

  @override
  bool operator ==(covariant AppSettings other) {
    if (identical(this, other)) return true;

    return other.openAiModel == openAiModel && other.locale == locale;
  }

  @override
  int get hashCode => openAiModel.hashCode ^ locale.hashCode;
}
