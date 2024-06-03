// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:boxting/widgets/navigation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'boxting_modal.dart';

class ConnectivityVerifier extends StatefulWidget {
  const ConnectivityVerifier({super.key, required this.child});

  final Widget child;

  @override
  _ConnectivityVerifierState createState() => _ConnectivityVerifierState();
}

class _ConnectivityVerifierState extends State<ConnectivityVerifier> {
  final _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  static bool isVModalActive = false;

  Future<void> initConnectivity() async {
    ConnectivityResult result;

    try {
      result = (await _connectivity.checkConnectivity()).last;
    } on PlatformException catch (e) {
      throw Exception(e);
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus([result]);
  }

  void _updateConnectionStatus(List<ConnectivityResult> result) async {
    final connectivity = result.last;
    switch (connectivity) {
      case ConnectivityResult.none:
        if (!isVModalActive) {
          isVModalActive = true;
          await BoxtingModal.show(
            context,
            title: 'Perdimos la conexión...',
            message: 'Por favor revisa el acceso a internet...',
            barrierDismissible: false,
          );
          isVModalActive = false;
        }
        break;
      default:
        if (isVModalActive) {
          isVModalActive = false;
          BoxtingNavigation.pop(context);
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
