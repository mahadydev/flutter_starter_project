import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter_project/core/enums/network_enum.dart';
import 'package:flutter_starter_project/core/network/connection_checker/internet_connection_state.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class InternetConnectionCubit extends Cubit<InternetConnectionState> {
  InternetConnectionCubit({
    Connectivity? connectivity,
    InternetConnection? internetConnection,
  }) : _connectivity = connectivity ?? Connectivity(),
       _internetConnection = internetConnection ?? InternetConnection(),
       super(const InternetConnectionState()) {
    unawaited(_init());
  }
  final Connectivity _connectivity;
  final InternetConnection _internetConnection;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySub;
  StreamSubscription<InternetStatus>? _internetStatusSub;

  Future<void> _init() async {
    // Listen to connectivity changes
    _connectivitySub = _connectivity.onConnectivityChanged.listen(
      _onConnectivityChanged,
    );
    // Listen to internet status changes
    _internetStatusSub = _internetConnection.onStatusChange.listen(
      _onInternetStatusChanged,
    );

    // Initial check
    final connectivityResults = await _connectivity.checkConnectivity();
    final result = connectivityResults.isNotEmpty
        ? connectivityResults.first
        : ConnectivityResult.none;

    final internetStatus = await _internetConnection.hasInternetAccess;
    emit(
      state.copyWith(
        connectionType: _mapConnectivityResult(result),
        status: internetStatus
            ? AppInternetStatus.online
            : AppInternetStatus.offline,
      ),
    );
  }

  Future<void> _onConnectivityChanged(List<ConnectivityResult> results) async {
    final result = results.isNotEmpty ? results.first : ConnectivityResult.none;
    final internetStatus = await _internetConnection.hasInternetAccess;
    emit(
      state.copyWith(
        connectionType: _mapConnectivityResult(result),
        status: internetStatus
            ? AppInternetStatus.online
            : AppInternetStatus.offline,
      ),
    );
  }

  void _onInternetStatusChanged(InternetStatus status) {
    emit(
      state.copyWith(
        status: status == InternetStatus.connected
            ? AppInternetStatus.online
            : AppInternetStatus.offline,
      ),
    );
  }

  AppConnectionType _mapConnectivityResult(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        return AppConnectionType.wifi;
      case ConnectivityResult.mobile:
        return AppConnectionType.mobile;
      case ConnectivityResult.ethernet:
        return AppConnectionType.ethernet;
      case ConnectivityResult.bluetooth:
        return AppConnectionType.bluetooth;
      case ConnectivityResult.vpn:
        return AppConnectionType.vpn;
      case ConnectivityResult.other:
        return AppConnectionType.other;
      case ConnectivityResult.none:
        return AppConnectionType.none;
    }
  }

  @override
  Future<void> close() async {
    await _connectivitySub?.cancel();
    await _internetStatusSub?.cancel();
    return super.close();
  }
}
