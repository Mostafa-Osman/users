import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users/core/widgets/show_toast_dialog.dart';

import 'network_checker_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final Connectivity _connectivity = Connectivity();

  NetworkCubit() : super(NetworkConnected()) {
    _connectivity.onConnectivityChanged.listen(checkInternetAccess);
  }

  Future<void> checkInternetAccess(List<ConnectivityResult> results) async {
    try {
      log('_checkInternetAccess');
      final lookupResult = await InternetAddress.lookup('google.com');
      log('connection result $lookupResult');
      if (lookupResult.isNotEmpty && lookupResult[0].rawAddress.isNotEmpty) {
        emit(NetworkConnected());
      } else {
        emit(NetworkDisconnected());
        _showNoInternetToast();
      }
    } on SocketException catch (_) {
      emit(NetworkDisconnected());
      _showNoInternetToast();
    }
  }

  void _showNoInternetToast() {
    ShowToastDialog.showToast('No connection');
  }
}
