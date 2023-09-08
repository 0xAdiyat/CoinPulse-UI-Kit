import 'dart:math' as math;
import 'dart:ui';

import 'package:coin_pulse/components/custom_outline.dart';
import 'package:coin_pulse/widgets/glowing_icon.dart';
import 'package:coin_pulse/widgets/glowing_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;

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
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ExchangeRow(
                    ccIcon: const Icon(
                      CupertinoIcons.bitcoin,
                      size: 34,
                      color: Color(0xffFFDD48),
                    ),
                    fromCcName: "SOL",
                    ccContainerColor: const Color(0xff21200B),
                    currencyRateFromTxt: "1",
                    currencyRateToTxt: '35,394',
                    exchangeRateTxt: '567',
                    outerContainerColor: const Color(0xff315E65),
                    outerOutlineColors: [
                      Colors.transparent,
                      Colors.lightBlue.withOpacity(.4),
                      Colors.blueGrey.withOpacity(0.2),
                      Colors.blueAccent.withOpacity(0.1)
                    ],
                    isFromExchange: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const GlowingIcon(
                      glowColor: Color(0xff91DC9C),
                      child: Icon(
                        CupertinoIcons.arrow_swap,
                        size: 38,
                        shadows: [
                          Shadow(
                            color: Color(0xff91DC9C),
                            blurRadius: 20.0,
                          ),
                        ],
                        color: Color(
                          0xff91DC9C,
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  ExchangeRow(
                    ccIcon: const Icon(
                      CupertinoIcons.money_dollar,
                      size: 34,
                      color: Color(0xff5DBBC8),
                    ),
                    toCcName: "ADA",
                    ccContainerColor: const Color(0xff0B2223),
                    exchangeRateTxt: '20 069',
                    outerContainerColor: const Color(0xff665107),
                    outerOutlineColors: [
                      Colors.transparent,
                      Colors.amberAccent.withOpacity(.4),
                      Colors.amberAccent.withOpacity(0.2),
                      Colors.amber.withOpacity(0.1)
                    ],
                    isFromExchange: false,
                    toCurrencyRate: '40,717.68',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ExchangeRow extends StatelessWidget {
  const ExchangeRow({
    super.key,
    required this.ccIcon,
    this.fromCcName,
    required this.ccContainerColor,
    this.currencyRateFromTxt,
    this.currencyRateToTxt,
    required this.exchangeRateTxt,
    required this.outerContainerColor,
    required this.outerOutlineColors,
    required this.isFromExchange,
    this.toCurrencyRate,
    this.toCcName,
  });

  final Widget ccIcon;
  final String? fromCcName, toCcName;
  final Color ccContainerColor;
  final String? currencyRateFromTxt, currencyRateToTxt, toCurrencyRate;
  final Color outerContainerColor;
  final List<Color> outerOutlineColors;
  final String exchangeRateTxt;
  final bool isFromExchange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 65,
              width: 65,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: ccContainerColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: IconButton(onPressed: () {}, icon: ccIcon),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              fromCcName ?? toCcName!,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            )
          ],
        ),
        OutlinedGradientContainer(
          fromCcName: fromCcName ?? "",
          toCcName: toCcName ?? "",
          currencyRateFromTxt: currencyRateFromTxt,
          currencyRateToTxt: currencyRateToTxt,
          exchangeRateTxt: exchangeRateTxt,
          outerContainerColor: outerContainerColor,
          outerOutlineColors: outerOutlineColors,
          toCurrencyRate: toCurrencyRate,
          isFromExchange: isFromExchange,
        ),
      ],
    );
  }
}

class BlurredGradientOverlay extends StatelessWidget {
  const BlurredGradientOverlay({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        width: 210,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
          child: Container(
            height: 320,
            width: 210,
            color: Colors.transparent,
          ),
        ));
  }
}

class OutlinedGradientContainer extends StatelessWidget {
  const OutlinedGradientContainer({
    super.key,
    this.fromCcName,
    this.toCcName,
    this.currencyRateFromTxt,
    this.currencyRateToTxt,
    required this.exchangeRateTxt,
    required this.outerContainerColor,
    required this.outerOutlineColors,
    required this.isFromExchange,
    this.toCurrencyRate,
  });
  final String? fromCcName, toCcName;
  final String? currencyRateFromTxt, currencyRateToTxt, toCurrencyRate;
  final Color outerContainerColor;
  final List<Color> outerOutlineColors;
  final bool isFromExchange;
  final String exchangeRateTxt;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      width: 203,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
            transform: const GradientRotation(6),
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Colors.transparent,
              outerContainerColor.withOpacity(0.3),
            ],
            stops: const [
              0.6,
              0.9
            ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CustomOutline(
          strokeWidth: 3,
          radius: 26,
          padding: const EdgeInsets.all(0),
          width: 0,
          height: 0,
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: outerOutlineColors,
              stops: const [.2, .6, .8, .1]),
          child: Container(
            padding: const EdgeInsets.only(right: 15),
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  transform: const GradientRotation(math.pi / 4),
                  colors: [
                    Colors.transparent,
                    const Color(0xff153439).withOpacity(0.7)
                  ]),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  isFromExchange
                      ? "$currencyRateFromTxt $fromCcName ~ $currencyRateToTxt $toCcName"
                      : "~\$$toCurrencyRate",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xff7B939A),
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                GlowingTextWidget(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  text: exchangeRateTxt,
                  glowColor: Colors.white.withOpacity(0.7),
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
