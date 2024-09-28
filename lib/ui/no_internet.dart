import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/connection_check_provider.dart';

class NoInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.wifi_off,
              size: 100,
              color: Colors.red.shade400,
            ),
            const SizedBox(height: 20),
            const Text(
              'No Internet Connection',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please turn on your internet connection to continue.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Force the user to try to reconnect
                final internetProvider =
                    Provider.of<InternetProvider>(context, listen: false);
                internetProvider.checkInternetConnection();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
              child: const Text(
                'Retry',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
