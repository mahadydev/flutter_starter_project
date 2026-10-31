import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:material_ui/material_ui.dart';

part 'language_state.freezed.dart';

@freezed
sealed class LanguageState with _$LanguageState {
  const factory LanguageState({Locale? locale}) = _LanguageState;
}
