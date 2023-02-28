// ignore_for_file: unnecessary_string_interpolations

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get langName => 'English';

  @override
  String get appName => 'OpenAI Gadget';

  @override
  String get labelGoToSimpleChat => 'Open Simple Chat';

  @override
  String get labelGoToMotivationals => 'Open Motivationals';

  @override
  String get labelSimpleChat => 'Simple Chat';

  @override
  String get labelMotivationals => 'Motivationals';

  @override
  String get labelTextCopied => 'Copied!';

  @override
  String get labelGenerate => 'Generate';

  @override
  String get tooltipLanguagePicker => '🌐';

  @override
  String get tooltipOpenAiTextModelPicker => 'Pick OpenAI text model';

  @override
  String get tooltipClearChat => 'Clear Chat History';

  @override
  String get labelEmptyChat => 'Type in whatever you would like to ask';

  @override
  String get labelMotivationalTextError => 'Error occured!\nClick on the button below to generate motivational text!';

  @override
  String get labelMotivationalTextEmpty => 'Click on the button below to generate motivational text!';
}
