import 'package:flutter/material.dart';
import 'package:flutter_starter_project/app/theme/app_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_state.freezed.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default('Figtree') final String fontFamily,
    @Default(AppColors.primary) final Color primaryColor,
    @Default(ThemeMode.system) final ThemeMode themeMode,
  }) = _ThemeState;
}
