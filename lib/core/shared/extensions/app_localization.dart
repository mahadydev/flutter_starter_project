import 'package:flutter/material.dart';
import 'package:flutter_starter_project/app/generated/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get localeKeys => AppLocalizations.of(this)!;
}
