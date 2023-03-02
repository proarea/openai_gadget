// ignore_for_file: unnecessary_string_interpolations

import 'app_localizations.dart';

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get langName => 'Українська';

  @override
  String get appName => 'OpenAI Gadget';

  @override
  String get labelGoToSimpleChat => 'Text Completions: Спрощений чат';

  @override
  String get labelGoToMotivationals => 'Text Completions: Генератор Мотиваційних Повідомлень';

  @override
  String get labelSimpleChat => 'Чат';

  @override
  String get labelMotivationals => 'Мотивація';

  @override
  String get labelTextCopied => 'Скопійовано!';

  @override
  String get labelGenerate => 'Згенерувати';

  @override
  String get tooltipLanguagePicker => '🌐';

  @override
  String get tooltipOpenAiTextModelPicker => 'Виберіть текстову модель OpenAI';

  @override
  String get tooltipClearChat => 'Очистити історію чату';

  @override
  String get labelEmptyChat => 'Введіть ваш запит у поле знизу';

  @override
  String get labelMotivationalTextError => 'Виникла помилка!\nНатисніть на кнопку знизу щоб згенерувати мотиваційний текст!';

  @override
  String get labelMotivationalTextEmpty => 'Натисніть на кнопку знизу щоб згенерувати мотиваційний текст!';

  @override
  String get labelSelected => 'Обрано';
}
