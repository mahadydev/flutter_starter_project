import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/app/generated/app_localizations.dart';
import 'package:flutter_starter_project/app/language/language_state.dart';
import 'package:flutter_starter_project/core/constants/storage_keys.dart';
import 'package:flutter_starter_project/core/storage/simple_storage.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit(this._storage) : super(const LanguageState());
  final SimpleStorageService _storage;

  /// Factory method to create an instance of [LanguageCubit].
  /// This method initializes the cubit and loads the saved language
  /// from storage.
  /// @param storage The [SimpleStorageService] instance used for saving/loading
  /// language settings.
  static Future<LanguageCubit> create(
    final SimpleStorageService storage,
  ) async {
    final LanguageCubit cubit = LanguageCubit(storage);
    await cubit.loadLanguage();
    return cubit;
  }

  /// Loads the saved language from storage or uses the
  /// device locale if none is saved.
  Future<void> loadLanguage() async {
    final String? localeString = await _storage.getString(StorageKeys.locale);
    if (localeString != null) {
      final List<String> parts = localeString.split('_');
      final Locale? savedLocale = parts.isNotEmpty ? Locale(parts[0]) : null;
      const List<Locale> supported = AppLocalizations.supportedLocales;
      final Locale locale = supported.firstWhere(
        (final Locale l) => l.languageCode == savedLocale?.languageCode,
        orElse: () => const Locale('en'),
      );
      emit(state.copyWith(locale: locale));
    } else {
      // Use device locale if supported, else fallback to default
      final Locale deviceLocale =
          WidgetsBinding.instance.platformDispatcher.locale;
      const List<Locale> supported = AppLocalizations.supportedLocales;
      final Locale locale = supported.firstWhere(
        (final Locale l) => l.languageCode == deviceLocale.languageCode,
        orElse: () => const Locale('en'),
      );
      emit(state.copyWith(locale: locale));
    }
  }

  /// Switches the app language to the specified [locale].
  /// This method updates the state with the new locale and saves it to storage.
  /// @param locale The new locale to switch to.
  Future<void> switchLanguage(final Locale locale) async {
    final List<String> parts = locale.toString().split('_');
    emit(state.copyWith(locale: parts.isNotEmpty ? Locale(parts[0]) : null));
    await _storage.setString(StorageKeys.locale, locale.toString());
  }
}
