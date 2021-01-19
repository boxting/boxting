import 'dart:async';

import 'package:boxting/widgets/navigation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'boxting_modal.dart';

class ConnectivityVerifier extends StatefulWidget {
  const ConnectivityVerifier({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _ConnectivityVerifierState createState() => _ConnectivityVerifierState();
}

class _ConnectivityVerifierState extends State<ConnectivityVerifier> {
  final _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  static bool isVModalActive = false;

  Future<void> initConnectivity() async {
    ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
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
