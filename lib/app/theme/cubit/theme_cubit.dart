import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/app/theme/cubit/theme_state.dart';
import 'package:flutter_starter_project/core/constants/storage_keys.dart';
import 'package:flutter_starter_project/core/storage/simple_storage.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._storage) : super(const ThemeState());

  final SimpleStorageService _storage;

  static Future<ThemeCubit> create(SimpleStorageService storage) async {
    final cubit = ThemeCubit(storage);
    await cubit.loadTheme();
    return cubit;
  }

  Future<void> switchTheme(ThemeMode theme) async {
    emit(state.copyWith(themeMode: theme));
    await _storage.setString(StorageKeys.themeMode, theme.toString());
  }

  Future<void> loadTheme() async {
    final themeString = await _storage.getString(StorageKeys.themeMode);
    if (themeString != null) {
      final theme = ThemeMode.values.firstWhere(
        (e) => e.toString() == themeString,
        orElse: () => ThemeMode.system,
      );
      emit(state.copyWith(themeMode: theme));
    }
  }
}
