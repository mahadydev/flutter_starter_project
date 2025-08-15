// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get helloWorld => 'ہیلو ورلڈ!';

  @override
  String get connectionStatus => 'کنکشن اسٹیٹس';

  @override
  String get theme => 'تھیم';

  @override
  String get toggleTheme => 'تھیم تبدیل کریں';

  @override
  String themeSwitched(Object theme) {
    return 'تھیم $theme میں تبدیل ہو گیا';
  }

  @override
  String get language => 'زبان';

  @override
  String languageSwitched(Object lang) {
    return 'زبان $lang میں تبدیل ہو گئی';
  }

  @override
  String current(Object value) {
    return 'موجودہ: $value';
  }

  @override
  String get networking => 'نیٹ ورکنگ';

  @override
  String get callNetwork => 'نیٹ ورک کال';

  @override
  String get storage => 'اسٹوریج';

  @override
  String get saveValue => 'ویلیو محفوظ کریں';

  @override
  String get readValue => 'ویلیو پڑھیں';

  @override
  String stored(Object value) {
    return 'محفوظ شدہ: $value';
  }

  @override
  String get snackbarUtils => 'اسنیک بار اور یوٹیلٹی';

  @override
  String get showSnackbar => 'اسنیک بار دکھائیں';

  @override
  String get snackbarMessage => 'یہ اسنیک بار شوکیس سے ہے!';

  @override
  String get loading => 'لوڈ ہو رہا ہے...';

  @override
  String error(Object message) {
    return 'خرابی: $message';
  }

  @override
  String get noValueFound => 'کوئی ویلیو نہیں ملی';

  @override
  String get savedToStorage => 'اسٹوریج میں محفوظ ہو گیا!';

  @override
  String get driftDatabase => 'ڈرفٹ ڈیٹا بیس';

  @override
  String get addItem => 'آئٹم شامل کریں';

  @override
  String get clearAll => 'سب صاف کریں';

  @override
  String get noItemsInDatabase => 'ڈیٹا بیس میں کوئی آئٹم نہیں۔';

  @override
  String itemInfo(Object id, Object name, Object value) {
    return 'آئی ڈی: $id, نام: $name, ویلیو: $value';
  }
}
