import 'package:coin_pulse/components/custom_outline.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../../widgets/glowing_text_widget.dart';

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
    required this.innerContainerColor,
  });
  final String? fromCcName, toCcName;
  final String? currencyRateFromTxt, currencyRateToTxt, toCurrencyRate;
  final Color outerContainerColor, innerContainerColor;
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
            transform: GradientRotation(isFromExchange ? 6 : 9),
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
              transform: GradientRotation(isFromExchange ? 6 : 9),
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
                    innerContainerColor.withOpacity(0.7)
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
