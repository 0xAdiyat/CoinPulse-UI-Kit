import 'package:coin_pulse/config/config.dart';
import 'package:flutter/material.dart';

import '../../../widgets/glowing_text_widget.dart';

class CCRateDetails extends StatelessWidget {
  const CCRateDetails({
    super.key,
    required this.isFromExchange,
    required this.currencyRateFromTxt,
    required this.fromCcName,
    required this.currencyRateToTxt,
    required this.toCcName,
    required this.toCurrencyRate,
    required this.exchangeRateTxt,
    this.ccRateTxtColor,
  });

  final bool isFromExchange;
  final String? currencyRateFromTxt;
  final String? fromCcName;
  final String? currencyRateToTxt;
  final String? toCcName;
  final String? toCurrencyRate;
  final String exchangeRateTxt;
  final Color? ccRateTxtColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          isFromExchange
              ? AppStrings.getCurrencyRateTextFormat(
                  currencyRateFromTxt: currencyRateFromTxt,
                  fromCcName: fromCcName,
                  currencyRateToTxt: currencyRateToTxt,
                  toCcName: toCcName)
              : AppStrings.getCurrencyRateTextFormat(
                  toCurrencyRate: toCurrencyRate),
          textAlign: TextAlign.end,
          style: TextStyle(
              fontSize: 14,
              color: ccRateTxtColor ?? kDarkBlueTextColor,
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
    );
  }
}
