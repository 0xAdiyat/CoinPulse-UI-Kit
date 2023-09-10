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
  });

  final bool isFromExchange;
  final String? currencyRateFromTxt;
  final String? fromCcName;
  final String? currencyRateToTxt;
  final String? toCcName;
  final String? toCurrencyRate;
  final String exchangeRateTxt;

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
