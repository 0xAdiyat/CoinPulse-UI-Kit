import 'package:coin_pulse/config/config.dart';
import 'package:coin_pulse/view/view.dart';
import 'package:flutter/material.dart';

class CoinPulseApp extends StatelessWidget {
  const CoinPulseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      themeMode: ThemeMode.system,
      theme: AppThemes.lightTheme(context),
      darkTheme: AppThemes.darkTheme(context),
    );
  }
}
