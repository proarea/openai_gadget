// ignore_for_file: unnecessary_string_interpolations

import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'OpenAI Gadget';

  @override
  String get labelGoToSimpleChat => 'Open Simple Chat';

  @override
  String get labelTextModelName => 'Text Model Name';

  @override
  String get labelClearChatHistory => 'Clear Chat History';
}
