// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحبا بالعالم!';

  @override
  String get connectionStatus => 'حالة الاتصال';

  @override
  String get theme => 'المظهر';

  @override
  String get toggleTheme => 'تبديل المظهر';

  @override
  String themeSwitched(Object theme) {
    return 'تم تبديل المظهر إلى $theme';
  }

  @override
  String get language => 'اللغة';

  @override
  String languageSwitched(Object lang) {
    return 'تم تبديل اللغة إلى $lang';
  }

  @override
  String current(Object value) {
    return 'الحالي: $value';
  }

  @override
  String get networking => 'الشبكة';

  @override
  String get callNetwork => 'اتصال بالشبكة';

  @override
  String get storage => 'التخزين';

  @override
  String get saveValue => 'حفظ القيمة';

  @override
  String get readValue => 'قراءة القيمة';

  @override
  String stored(Object value) {
    return 'المخزن: $value';
  }

  @override
  String get snackbarUtils => 'الإشعارات والأدوات';

  @override
  String get showSnackbar => 'إظهار إشعار';

  @override
  String get snackbarMessage => 'هذا إشعار من شاشة العرض!';

  @override
  String get loading => 'جار التحميل...';

  @override
  String error(Object message) {
    return 'خطأ: $message';
  }

  @override
  String get noValueFound => 'لا توجد قيمة';

  @override
  String get savedToStorage => 'تم الحفظ في التخزين!';

  @override
  String get driftDatabase => 'قاعدة بيانات دريفت';

  @override
  String get addItem => 'إضافة عنصر';

  @override
  String get clearAll => 'مسح الكل';

  @override
  String get noItemsInDatabase => 'لا توجد عناصر في قاعدة البيانات.';

  @override
  String itemInfo(Object id, Object name, Object value) {
    return 'المعرف: $id، الاسم: $name، القيمة: $value';
  }
}
