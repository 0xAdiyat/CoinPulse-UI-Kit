import 'package:animate_do/animate_do.dart';
import 'package:coin_pulse/config/config.dart';
import 'package:coin_pulse/config/constants/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../widgets/glowing_icon.dart';
import 'components/components.dart';

class ExchangePage extends StatefulWidget {
  const ExchangePage({
    super.key,
  });

  @override
  State<ExchangePage> createState() => _ExchangePageState();
}

class _ExchangePageState extends State<ExchangePage> {
  late AnimationController _animationController,
      _firstExchangeAnimController,
      _lastExchangeAnimController;
  bool swipePosition = false;

  @override
  Widget build(BuildContext context) {
    var fromCCIconWidget = SvgPicture.asset(
      AppIcons.bnbCC,
      height: 30,
      fit: BoxFit.cover,
    );
    var toCCIconWidget = SvgPicture.asset(
      AppIcons.xtzCC,
      height: 28,
      fit: BoxFit.cover,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildExchangeSystemBox(fromCCIconWidget, toCCIconWidget),
          const SizedBox(
            height: 60,
          ),
          FadeIn(child: const TransactionSwapRow()),
        ],
      ),
    );
  }

  SizedBox buildExchangeSystemBox(
      SvgPicture fromCCIconWidget, SvgPicture toCCIconWidget) {
    return SizedBox(
      height: 350,
      child: Stack(
        children: [
          Positioned(
            bottom: swipePosition ? 0 : null,
            top: swipePosition ? null : 0,
            left: 0,
            right: 0,
            child: FlipInX(
              controller: (controller) =>
                  _firstExchangeAnimController = controller,
              child: CCExchangeRow(
                swipedPosition: swipePosition,
                ccIcon: fromCCIconWidget,
                fromCcName: "BNB",
                ccContainerColor: kDeepOrangeColor,
                currencyRateFromTxt: "1",
                currencyRateToTxt: '35,394',
                exchangeRateTxt: '567',
                outerContainerColor: kBlueGradientOuterContainerColor,
                outerOutlineColors: kBlueGradientOuterLineColors,
                innerContainerColor: kBlueGradientInnerContainerColor,
                isFromExchange: true,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: FlipInX(
              controller: (controller) => _animationController = controller,
              child: GlowingIcon(
                glowColor: kGreenGlowColor,
                child: IconButton(
                  icon: const Icon(
                    CupertinoIcons.arrow_swap,
                    size: 30,
                    shadows: [
                      Shadow(
                        color: kGreenGlowColor,
                        blurRadius: 40.0,
                      ),
                    ],
                  ),
                  color: kGreenGlowColor,
                  onPressed: () {
                    setState(() {
                      _animationController.reset();
                      _animationController.forward();
                      _firstExchangeAnimController.reset();
                      _firstExchangeAnimController.forward();
                      _lastExchangeAnimController.reset();
                      _lastExchangeAnimController.forward();
                      swipePosition = !swipePosition;
                    });
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: swipePosition ? 0 : null,
            bottom: swipePosition ? null : 0,
            left: 0,
            right: 0,
            child: FlipInX(
              controller: (controller) =>
                  _lastExchangeAnimController = controller,
              child: CCExchangeRow(
                ccIcon: toCCIconWidget,
                toCcName: "XTZ",
                ccContainerColor: kDeepBlueColor,
                exchangeRateTxt: '20 069',
                ccRateTxtColor: kDarkOrangeTextColor,
                outerContainerColor: kOrangeGradientOuterContainerColor,
                outerOutlineColors: kOrangeGradientOuterLineColors,
                isFromExchange: false,
                toCurrencyRate: '40,717.68',
                innerContainerColor: kOrangeGradientInnerContainerColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
