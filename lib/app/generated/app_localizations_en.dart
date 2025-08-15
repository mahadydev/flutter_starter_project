// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get connectionStatus => 'Connection Status';

  @override
  String get theme => 'Theme';

  @override
  String get toggleTheme => 'Toggle Theme';

  @override
  String themeSwitched(Object theme) {
    return 'Theme switched to $theme';
  }

  @override
  String get language => 'Language';

  @override
  String languageSwitched(Object lang) {
    return 'Language switched to $lang';
  }

  @override
  String current(Object value) {
    return 'Current: $value';
  }

  @override
  String get networking => 'Networking';

  @override
  String get callNetwork => 'Call Network';

  @override
  String get storage => 'Storage';

  @override
  String get saveValue => 'Save Value';

  @override
  String get readValue => 'Read Value';

  @override
  String stored(Object value) {
    return 'Stored: $value';
  }

  @override
  String get snackbarUtils => 'Snackbar & Utils';

  @override
  String get showSnackbar => 'Show Snackbar';

  @override
  String get snackbarMessage => 'This is a snackbar from Showcase!';

  @override
  String get loading => 'Loading...';

  @override
  String error(Object message) {
    return 'Error: $message';
  }

  @override
  String get noValueFound => 'No value found';

  @override
  String get savedToStorage => 'Saved to storage!';

  @override
  String get driftDatabase => 'Drift Database';

  @override
  String get addItem => 'Add Item';

  @override
  String get clearAll => 'Clear All';

  @override
  String get noItemsInDatabase => 'No items in database.';

  @override
  String itemInfo(Object id, Object name, Object value) {
    return 'ID: $id, Name: $name, Value: $value';
  }
}
