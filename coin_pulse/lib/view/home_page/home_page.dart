import 'package:animate_do/animate_do.dart';
import 'package:coin_pulse/config/config.dart';
import 'package:coin_pulse/config/constants/app_const.dart';
import 'package:coin_pulse/view/deposit_page/deposit_page.dart';
import 'package:coin_pulse/view/home_page/components/tri_circular_navbar.dart';
import 'package:flutter/material.dart';

import '../../widgets/blurred_gradient_overlay.dart';
import '../exchange_page/exchange_page.dart';
import '../order_page/order_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTriNavBtn = 0;
  PageController? _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      extendBody: true,
      body: Stack(
        children: [
          const Positioned(
            top: -100,
            right: -100,
            child: BlurredGradientOverlay(color: kTopRightOverlayColor),
          ),
          const Positioned(
            bottom: -100,
            left: -100,
            child: BlurredGradientOverlay(color: kBottomLeftOverlayColor),
          ),
          const Positioned(
            bottom: 0,
            top: -200,
            left: 0,
            right: 0,
            child: BlurredGradientOverlay(
              color: kCenterTopOverlayColor,
              height: 100,
              width: 100,
              sigmaXY: 220,
            ),
          ),
          SafeArea(
            top: selectedTriNavBtn == 1 ? false : true,
            child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [
                  ExchangePage(),
                  DepositPage(),
                  OrderPage(),
                ]),
          ),
          AnimatedPositioned(
            curve: Curves.easeInCubic,
            duration: const Duration(milliseconds: kAnimationDuration ~/ 2),
            bottom: selectedTriNavBtn == 1 ? -150 : 70,
            right: 0,
            left: 0,
            child: AnimatedContainer(
              curve: Curves.easeInOutCubicEmphasized,
              duration: const Duration(milliseconds: kAnimationDuration),
              height: selectedTriNavBtn == 1
                  ? 300 + (5 * kTriCircularSpacing)
                  : 300 + (2 * kTriCircularSpacing),
              child: FadeIn(
                child: TriCircularNavBar(
                  currentSelectedNavButton: (int value) {
                    setState(() {
                      selectedTriNavBtn = value;
                      _pageController!.jumpToPage(selectedTriNavBtn);
                    });
                  },
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: kAnimationDuration),
            top: selectedTriNavBtn == 3
                ? 200
                : selectedTriNavBtn == 1
                    ? 300
                    : 0,
            bottom: selectedTriNavBtn == 2 ? -600 : -400,
            left: selectedTriNavBtn == 3 ? -200 : 0,
            right: selectedTriNavBtn == 1 ? 100 : -100,
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
