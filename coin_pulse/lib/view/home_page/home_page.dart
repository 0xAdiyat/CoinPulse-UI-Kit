import 'package:coin_pulse/config/config.dart';
import 'package:coin_pulse/view/home_page/components/tri_circular_navbar.dart';
import 'package:flutter/material.dart';

import '../../components/blurred_gradient_overlay.dart';
import '../exchange_page/exchange_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBody: true,
      body: Stack(
        children: [
          const Positioned(
            top: -100,
            right: -100,
            child: BlurredGradientOverlay(color: Color(0xff0A3C47)),
          ),
          const Positioned(
            bottom: -100,
            left: -100,
            child: BlurredGradientOverlay(color: Color(0xff326045)),
          ),
          const Positioned(
            bottom: 0,
            top: -200,
            left: 0,
            right: 0,
            child: BlurredGradientOverlay(
              color: Color(0xff211F09),
              height: 100,
              width: 100,
              sigmaXY: 220,
            ),
          ),
          const ExchangePage(),
          Positioned(bottom: 70, right: 0, left: 0, child: TriCircularNavBar()),
          Positioned(
            top: 0,
            bottom: -400,
            left: 0,
            right: -100,
            child: IgnorePointer(
              child: Image.asset(
                AppImages.greenEclipse,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
