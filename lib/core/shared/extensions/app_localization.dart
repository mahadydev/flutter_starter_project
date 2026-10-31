import 'package:flutter_starter_project/app/generated/app_localizations.dart';
import 'package:material_ui/material_ui.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get localeKeys => AppLocalizations.of(this)!;
}
