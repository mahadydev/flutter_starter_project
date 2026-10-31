import 'package:flutter_starter_project/app/theme/app_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_ui/material_ui.dart';

part 'theme_state.freezed.dart';

@freezed
sealed class ThemeState with _$ThemeState {
  const factory ThemeState({
    @Default('Figtree') String fontFamily,
    @Default(AppColors.primary) Color primaryColor,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _ThemeState;
}
