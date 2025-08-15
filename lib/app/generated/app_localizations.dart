import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('bn'),
    Locale('en'),
    Locale('es'),
    Locale('ur'),
  ];

  /// The conventional newborn programmer greeting
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// Section title for connection status
  ///
  /// In en, this message translates to:
  /// **'Connection Status'**
  String get connectionStatus;

  /// Section title for theme
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// Button to toggle theme
  ///
  /// In en, this message translates to:
  /// **'Toggle Theme'**
  String get toggleTheme;

  /// Message shown when theme is switched
  ///
  /// In en, this message translates to:
  /// **'Theme switched to {theme}'**
  String themeSwitched(Object theme);

  /// Section title for language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// Message shown when language is switched
  ///
  /// In en, this message translates to:
  /// **'Language switched to {lang}'**
  String languageSwitched(Object lang);

  /// Shows the current value
  ///
  /// In en, this message translates to:
  /// **'Current: {value}'**
  String current(Object value);

  /// Section title for networking
  ///
  /// In en, this message translates to:
  /// **'Networking'**
  String get networking;

  /// Button to call network
  ///
  /// In en, this message translates to:
  /// **'Call Network'**
  String get callNetwork;

  /// Section title for storage
  ///
  /// In en, this message translates to:
  /// **'Storage'**
  String get storage;

  /// Button to save value
  ///
  /// In en, this message translates to:
  /// **'Save Value'**
  String get saveValue;

  /// Button to read value
  ///
  /// In en, this message translates to:
  /// **'Read Value'**
  String get readValue;

  /// Shows the stored value
  ///
  /// In en, this message translates to:
  /// **'Stored: {value}'**
  String stored(Object value);

  /// Section title for snackbar and utils
  ///
  /// In en, this message translates to:
  /// **'Snackbar & Utils'**
  String get snackbarUtils;

  /// Button to show snackbar
  ///
  /// In en, this message translates to:
  /// **'Show Snackbar'**
  String get showSnackbar;

  /// Message shown in the snackbar
  ///
  /// In en, this message translates to:
  /// **'This is a snackbar from Showcase!'**
  String get snackbarMessage;

  /// Loading message
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// Error message with details
  ///
  /// In en, this message translates to:
  /// **'Error: {message}'**
  String error(Object message);

  /// Message when no value is found in storage
  ///
  /// In en, this message translates to:
  /// **'No value found'**
  String get noValueFound;

  /// Message when value is saved to storage
  ///
  /// In en, this message translates to:
  /// **'Saved to storage!'**
  String get savedToStorage;

  /// Section title for Drift database
  ///
  /// In en, this message translates to:
  /// **'Drift Database'**
  String get driftDatabase;

  /// Button to add item to Drift database
  ///
  /// In en, this message translates to:
  /// **'Add Item'**
  String get addItem;

  /// Button to clear all items from Drift database
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// Message when there are no items in the Drift database
  ///
  /// In en, this message translates to:
  /// **'No items in database.'**
  String get noItemsInDatabase;

  /// Shows info for a Drift database item
  ///
  /// In en, this message translates to:
  /// **'ID: {id}, Name: {name}, Value: {value}'**
  String itemInfo(Object id, Object name, Object value);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'bn', 'en', 'es', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
