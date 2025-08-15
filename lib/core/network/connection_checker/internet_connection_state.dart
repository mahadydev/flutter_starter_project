import 'package:flutter_starter_project/core/enums/network_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'internet_connection_state.freezed.dart';

@freezed
sealed class InternetConnectionState with _$InternetConnectionState {
  const factory InternetConnectionState({
    @Default(AppConnectionType.none) AppConnectionType connectionType,
    @Default(AppInternetStatus.offline) AppInternetStatus status,
  }) = _InternetConnectionState;
}
