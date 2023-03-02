// ignore_for_file: unnecessary_string_interpolations
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_uk.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('uk')
  ];

  /// No description provided for @langName.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get langName;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'OpenAI Gadget'**
  String get appName;

  /// No description provided for @labelGoToSimpleChat.
  ///
  /// In en, this message translates to:
  /// **'Text Completions: Simple Chat'**
  String get labelGoToSimpleChat;

  /// No description provided for @labelGoToMotivationals.
  ///
  /// In en, this message translates to:
  /// **'Text Completions: Motivational message generator'**
  String get labelGoToMotivationals;

  /// No description provided for @labelSimpleChat.
  ///
  /// In en, this message translates to:
  /// **'Simple Chat'**
  String get labelSimpleChat;

  /// No description provided for @labelMotivationals.
  ///
  /// In en, this message translates to:
  /// **'Motivationals'**
  String get labelMotivationals;

  /// No description provided for @labelTextCopied.
  ///
  /// In en, this message translates to:
  /// **'Copied!'**
  String get labelTextCopied;

  /// No description provided for @labelGenerate.
  ///
  /// In en, this message translates to:
  /// **'Generate'**
  String get labelGenerate;

  /// No description provided for @tooltipLanguagePicker.
  ///
  /// In en, this message translates to:
  /// **'🌐'**
  String get tooltipLanguagePicker;

  /// No description provided for @tooltipOpenAiTextModelPicker.
  ///
  /// In en, this message translates to:
  /// **'Pick OpenAI text model'**
  String get tooltipOpenAiTextModelPicker;

  /// No description provided for @tooltipClearChat.
  ///
  /// In en, this message translates to:
  /// **'Clear Chat History'**
  String get tooltipClearChat;

  /// No description provided for @labelEmptyChat.
  ///
  /// In en, this message translates to:
  /// **'Type in whatever you would like to ask'**
  String get labelEmptyChat;

  /// No description provided for @labelMotivationalTextError.
  ///
  /// In en, this message translates to:
  /// **'Error occured!\nClick on the button below to generate motivational text!'**
  String get labelMotivationalTextError;

  /// No description provided for @labelMotivationalTextEmpty.
  ///
  /// In en, this message translates to:
  /// **'Click on the button below to generate motivational text!'**
  String get labelMotivationalTextEmpty;

  /// No description provided for @labelSelected.
  ///
  /// In en, this message translates to:
  /// **'Selected'**
  String get labelSelected;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'uk'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'uk': return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
