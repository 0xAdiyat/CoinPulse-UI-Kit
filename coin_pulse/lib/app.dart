import 'package:coin_pulse/view/view.dart';
import 'package:flutter/material.dart';

class CoinPulseApp extends MaterialApp{
  CoinPulseApp({super.key}): super(home: const HomePage(),debugShowCheckedModeBanner: false, debugShowMaterialGrid: false, theme: ThemeData(useMaterial3: false, ),);
}