import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lat_htauk_day_din/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LatHtaukBayDin',
      home: SplashScreen()
    );
  }
}
