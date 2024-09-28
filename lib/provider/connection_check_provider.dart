import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Internet Connectivity Provider
class InternetProvider with ChangeNotifier {
  bool _isConnected = true;

  bool get isConnected => _isConnected;

  InternetProvider() {
    // Check connectivity initially and start listening for changes
    checkInternetConnection();
    _startMonitoring();
  }

  void checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isConnected = true;
      } else {
        _isConnected = false;
      }
    } catch (_) {
      _isConnected = false;
    }
    notifyListeners();
  }

  // Periodically check for internet connection every few seconds
  void _startMonitoring() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      checkInternetConnection();
    });
  }
}
