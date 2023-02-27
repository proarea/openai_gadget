import 'package:flutter/material.dart';

import 'app_localizations.dart';

export 'app_localizations.dart';

extension BuildContextLocalizationExt on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this);
}
