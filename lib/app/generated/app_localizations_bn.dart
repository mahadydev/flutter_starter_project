// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get helloWorld => 'হ্যালো ওয়ার্ল্ড!';

  @override
  String get connectionStatus => 'সংযোগের অবস্থা';

  @override
  String get theme => 'থিম';

  @override
  String get toggleTheme => 'থিম পরিবর্তন করুন';

  @override
  String themeSwitched(Object theme) {
    return 'থিম $theme এ পরিবর্তন হয়েছে';
  }

  @override
  String get language => 'ভাষা';

  @override
  String languageSwitched(Object lang) {
    return 'ভাষা $lang এ পরিবর্তন হয়েছে';
  }

  @override
  String current(Object value) {
    return 'বর্তমান: $value';
  }

  @override
  String get networking => 'নেটওয়ার্কিং';

  @override
  String get callNetwork => 'নেটওয়ার্ক কল';

  @override
  String get storage => 'স্টোরেজ';

  @override
  String get saveValue => 'মান সংরক্ষণ করুন';

  @override
  String get readValue => 'মান পড়ুন';

  @override
  String stored(Object value) {
    return 'সংরক্ষিত: $value';
  }

  @override
  String get snackbarUtils => 'স্ন্যাকবার ও ইউটিলিটি';

  @override
  String get showSnackbar => 'স্ন্যাকবার দেখান';

  @override
  String get snackbarMessage => 'এটি শোকেস থেকে একটি স্ন্যাকবার!';

  @override
  String get loading => 'লোড হচ্ছে...';

  @override
  String error(Object message) {
    return 'ত্রুটি: $message';
  }

  @override
  String get noValueFound => 'কোনো মান পাওয়া যায়নি';

  @override
  String get savedToStorage => 'স্টোরেজে সংরক্ষিত!';

  @override
  String get driftDatabase => 'ড্রিফট ডাটাবেস';

  @override
  String get addItem => 'আইটেম যোগ করুন';

  @override
  String get clearAll => 'সব মুছে ফেলুন';

  @override
  String get noItemsInDatabase => 'ডাটাবেসে কোনো আইটেম নেই।';

  @override
  String itemInfo(Object id, Object name, Object value) {
    return 'আইডি: $id, নাম: $name, মান: $value';
  }
}
