import 'package:flutter/material.dart';

import 'outlined_gradient_container.dart';

class CCExchangeRow extends StatelessWidget {
  const CCExchangeRow({
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
    required this.innerContainerColor,
  });

  final Widget ccIcon;
  final String? fromCcName, toCcName;
  final Color ccContainerColor;
  final String? currencyRateFromTxt, currencyRateToTxt, toCurrencyRate;
  final Color outerContainerColor, innerContainerColor;
  final List<Color> outerOutlineColors;
  final String exchangeRateTxt;
  final bool isFromExchange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        cCIconNameRow(),
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
          innerContainerColor: innerContainerColor,
        ),
      ],
    );
  }

  Row cCIconNameRow() {
    return Row(
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
    );
  }
}
