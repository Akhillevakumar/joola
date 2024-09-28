import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_project/ui/no_internet.dart';
import 'package:test_project/ui/splash.dart';

import 'provider/connection_check_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => InternetProvider(),
      child: JoolaApp(),
    ),
  );
}

class JoolaApp extends StatelessWidget {
  const JoolaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Consumer<InternetProvider>(
          builder: (context, internetProvider, child) {
        if (internetProvider.isConnected) {
          return SplashScreen();
        } else {
          return NoInternetScreen();
        }
      }),
    );
  }
}
